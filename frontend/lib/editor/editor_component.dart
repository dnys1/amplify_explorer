import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:codemirror/codemirror.dart';
import 'package:stream_transform/stream_transform.dart';

const defaultSchema = '''
type Todo @model {
  id: ID!
  name: String!
  description: String
}''';

@Component(
  selector: 'editor',
  templateUrl: 'editor_component.html',
  styleUrls: ['editor_component.css'],
)
class EditorComponent implements AfterContentInit {
  CodeMirror? _editor;

  final StreamController<String> _schemaController = StreamController();
  final Element editorElement;

  EditorComponent(this.editorElement);

  @Input()
  bool readOnly = false;

  Completer<void> _onInit = Completer();
  Future<void> get onInit => _onInit.future;

  @override
  void ngAfterContentInit() {
    _editor = CodeMirror.fromElement(
      editorElement,
      options: <String, dynamic>{
        'lineNumbers': !readOnly,
        'autoCloseBrackets': true,
        'matchBrackets': true,
        'tabSize': 2,
        'lineWrapping': true,
        'extraKeys': {
          'Cmd-/': 'toggleComment',
          'Ctrl-/': 'toggleComment',
          'Tab': 'insertSoftTab'
        },
        'mode': 'graphql',
        'theme': 'appsync',
      },
    );
    _editor!.callArgs('setSize', <String>['100%', '100%']);
    _schemaController.addStream(
      _editor!.onChange.map((dynamic event) {
        return _editor!.getDoc()?.getValue('\n') ?? '';
      }).cast<String>(),
    );
    if (readOnly) {
      _editor!.setReadOnly(true, true);
    } else {
      _editor!.getDoc()!.setValue(_text ?? '');
    }
    _onInit.complete();
  }

  String? _text;

  String get text => _text ?? _editor?.getDoc()?.getValue('\n') ?? '';

  @Input()
  set text(String text) {
    if (text == '') {
      return;
    }
    var doc = _editor?.getDoc();
    if (doc == null) {
      _text = text;
    } else {
      var cursorPos = doc.getCursor();
      doc.setValue(text);
      doc.setCursor(cursorPos);
      _text = null;
    }
  }

  @Output()
  Stream<String> get textChange =>
      _schemaController.stream.debounce(const Duration(milliseconds: 400));
}
