import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:amplify_explorer/editor/editor_component.dart';
import 'package:amplify_explorer/service/transform_service.dart';
import 'package:amplify_explorer/model/transform_request.dart';
import 'package:fo_components/fo_components.dart';
import 'package:http/http.dart' as http;

import 'model/config.dart';
import 'model/enum.dart';

@Component(
  selector: 'home',
  templateUrl: 'home_component.html',
  styleUrls: [
    'home_component.css',
  ],
  directives: [
    coreDirectives,
    EditorComponent,
    FoIconComponent,
    FoModalComponent,
    FoCheckComponent,
    FoRadioComponent,
    FoRadioGroupComponent,
    FoDropdownSelectComponent,
    FoLoadIndicatorComponent,
  ],
  exports: [
    AppSyncAuthMode,
    describeEnum,
  ],
)
class HomeComponent implements OnInit, AfterContentInit {
  final TransformService transformService;
  final ChangeDetectorRef _changeDetectorRef;

  String outputText = '';
  String? errorText;
  bool isModalShown = false;

  @ViewChild('button')
  ButtonElement? buttonElement;

  @ViewChild('dropdown')
  TemplateRef? dropdownTemplate;

  int? innerWidth;
  bool get showHeaderDropdown => innerWidth != null && innerWidth! >= 600;

  bool isLoading = false;

  String? selectedDropdownOption;
  final Map<String, List<FoDropdownOption>> dropdownOptions = {
    '': [
      FoDropdownOption('todo', 'Todo', icon: 'checklist'),
      FoDropdownOption('blog', 'Blog', icon: 'rss_feed'),
      FoDropdownOption('habitr', 'Habitr', icon: 'groups'),
    ]
  };

  static const _schemas = {
    'todo': defaultSchema,
    'blog': blogSchema,
  };

  void onSelectSchema(String schemaId) {
    switch (schemaId) {
      case 'habitr':
        _downloadHabitrSchema();
        return;
      default:
        updateText(_schemas[schemaId]!);
    }
  }

  Future<void> _downloadHabitrSchema() async {
    setBusy(true);
    try {
      final resp = await http.get(habitrUrl);
      if (resp.statusCode == 200) {
        updateText(resp.body);
        errorText = null;
        return;
      }
      throw Exception('${resp.statusCode}: ${resp.body}');
    } on Exception catch (e) {
      errorText = 'Could not download Habitr schema: $e';
      window.console.error(e);
    } finally {
      setBusy(false);
    }
  }

  HomeComponent(this.transformService, this._changeDetectorRef) {
    _config = _loadFromHash() ?? _loadFromStorage() ?? ExplorerConfig();
    if (_config.schema == defaultSchema) {
      selectedDropdownOption = 'todo';
    } else if (_config.schema == blogSchema) {
      selectedDropdownOption = 'blog';
    }
  }

  @override
  void ngOnInit() {
    innerWidth = window.innerWidth;
    window.onResize.listen((event) {
      innerWidth = window.innerWidth;
    });
  }

  ExplorerConfig? _loadFromHash() {
    if (window.location.hash.isEmpty) {
      return null;
    }

    try {
      // Chop off leading '#' character
      var hash = window.location.hash.substring(1);
      var json = jsonDecode(utf8.decode(base64Url.decode(hash))) as Object;
      return ExplorerConfig.fromJson(json) ??
          (throw FormatException('Could not decode JSON: $json'));
    } catch (e) {
      window.console.error('Error decoding hash: $e');
      return null;
    }
  }

  ExplorerConfig? _loadFromStorage() {
    try {
      var config = ExplorerConfigBuilder();
      var schema = window.localStorage['schema'];
      if (schema != null) {
        config.schema = schema;
      }
      var defaultAuthModeStr = window.localStorage['defaultAuthMode'];
      if (defaultAuthModeStr != null) {
        config.defaultAuthMode = AppSyncAuthMode.values.firstWhere(
          (mode) => describeEnum(mode) == defaultAuthModeStr,
        );
      }
      var additionalAuthModesStr = window.localStorage['additionalAuthModes'];
      if (additionalAuthModesStr != null) {
        var additionalAuthModesList =
            (jsonDecode(additionalAuthModesStr) as List).cast<String>();
        var additionalAuthModes = additionalAuthModesList.map((value) =>
            AppSyncAuthMode.values
                .firstWhere((mode) => describeEnum(mode) == value));
        config.additionalAuthModes.addAll(additionalAuthModes);
      }
      return config.build();
    } catch (e) {
      window.console.error('Error decoding localStorage: $e');
      return null;
    }
  }

  late ExplorerConfig _config;

  String get editorText => _config.schema;
  AppSyncAuthMode get defaultAuthMode => _config.defaultAuthMode;
  Set<AppSyncAuthMode> get additionalAuthModes =>
      UnmodifiableSetView(_config.additionalAuthModes.toSet());
  String get _encodedAdditionalAuthModes =>
      jsonEncode(additionalAuthModes.map((val) => describeEnum(val)).toList());

  Future<void> transform() async {
    if (isLoading) {
      return;
    }
    setBusy(true);
    try {
      final response = await transformService.transform(
        TransformRequest(
          schema: editorText,
          authOptions: AuthOptions(
            authConfig: AuthConfig(
              defaultAuthentication: DefaultAuthentication(
                authenticationType: defaultAuthMode,
                openIdConnectConfig: DefaultAuthenticationOpenIdConnectConfig(),
                userPoolConfig: DefaultAuthenticationUserPoolConfig(),
              ),
              additionalAuthenticationProviders: [
                for (var additionalProvider in additionalAuthModes.where(
                  (mode) => mode != defaultAuthMode,
                ))
                  AdditionalAuthenticationProvider(
                    authenticationType: additionalProvider,
                    openIdConnectConfig: additionalProvider ==
                            AppSyncAuthMode.OPENID_CONNECT
                        ? AdditionalAuthenticationProviderOpenIdConnectConfig()
                        : null,
                    userPoolConfig: additionalProvider ==
                            AppSyncAuthMode.AMAZON_COGNITO_USER_POOLS
                        ? AdditionalAuthenticationProviderUserPoolConfig()
                        : null,
                  )
              ],
            ),
          ),
          modelOptions: DynamoDbModelTransformerOptions(
            enableDeletionProtection: false,
            syncConfig: SyncConfig(
              conflictDetection: ConflictDetectionType.VERSION,
              conflictHandler: ConflictHandler.AUTOMERGE,
            ),
          ),
        ),
      );
      outputText = response.schema?.trim() ?? '';
      errorText = null;
    } on TransformException catch (e) {
      window.console.error(e);
      errorText = e.message;
    } on Exception catch (e) {
      window.console.error(e);
      errorText = 'An unknown error occurred. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  void setBusy(bool busy) {
    isLoading = busy;
  }

  @override
  void ngAfterContentInit() {
    updateText(editorText);
  }

  void updateText(String text) {
    _config = _config.rebuild((b) => b.schema = text);
    window.location.hash =
        base64UrlEncode(jsonEncode(_config.toJson()).codeUnits);
    _changeDetectorRef.markForCheck();
  }

  void updateDefaultMode(AppSyncAuthMode mode) {
    _config = _config.rebuild((b) {
      b.defaultAuthMode = mode;
      b.additionalAuthModes.remove(mode);
    });
    window.localStorage['defaultAuthMode'] = describeEnum(mode);
    window.localStorage['additionalAuthModes'] = _encodedAdditionalAuthModes;
    _changeDetectorRef.markForCheck();
  }

  void updateAdditionalAuthMode(AppSyncAuthMode mode, bool checked) {
    _config = _config.rebuild((b) {
      if (checked) {
        b.additionalAuthModes.add(mode);
      } else {
        b.additionalAuthModes.remove(mode);
      }
    });
    window.localStorage['additionalAuthModes'] = _encodedAdditionalAuthModes;
    _changeDetectorRef.markForCheck();
  }

  void showModal() {
    isModalShown = true;
  }
}

const blogSchema = '''
type Blog @model {
  id: ID!
  name: String!
  posts: [Post] @connection(keyName: "byBlog", fields: ["id"])
}

type Post @model @key(name: "byBlog", fields: ["blogID"]) {
  id: ID!
  title: String!
  blogID: ID!
  blog: Blog @connection(fields: ["blogID"])
  comments: [Comment] @connection(keyName: "byPost", fields: ["id"])
}

type Comment @model @key(name: "byPost", fields: ["postID", "content"]) {
  id: ID!
  postID: ID!
  post: Post @connection(fields: ["postID"])
  content: String!
}''';

final habitrUrl = Uri.parse(
    'https://raw.githubusercontent.com/dnys1/habitr/master/amplify/backend/api/habitr/schema.graphql');
