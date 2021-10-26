// To parse this JSON data, do
//
//     final velocityTemplateResponse = velocityTemplateResponseFromJson(jsonString);

import 'dart:convert';

VelocityTemplateResponse velocityTemplateResponseFromJson(String str) => VelocityTemplateResponse.fromJson(json.decode(str));

String velocityTemplateResponseToJson(VelocityTemplateResponse data) => json.encode(data.toJson());

class VelocityTemplateResponse {
    VelocityTemplateResponse({
         this.errors,
         this.hadException,
         this.isReturn,
         this.result,
         this.stash,
    });

    List<dynamic>? errors;
    bool? hadException;
    bool? isReturn;
    RecordStringAny? result;
    RecordStringAny? stash;

    factory VelocityTemplateResponse.fromJson(Map<String, dynamic> json) => VelocityTemplateResponse(
        errors: 
        json['errors'] == null ? null :
        List<dynamic>.from(json['errors'].map((x) => x)),
        hadException: 
        json['hadException'] == null ? null :
        json['hadException'],
        isReturn: 
        json['isReturn'] == null ? null :
        json['isReturn'],
        result: 
        json['result'] == null ? null :
        RecordStringAny.fromJson(json['result']),
        stash: 
        json['stash'] == null ? null :
        RecordStringAny.fromJson(json['stash']),
    );

    Map<String, dynamic> toJson() => {
        if (errors != null)
        'errors': List<dynamic>.from(errors!.map((x) => x)),
        if (hadException != null)
        'hadException': hadException,
        if (isReturn != null)
        'isReturn': isReturn,
        if (result != null)
        'result': result?.toJson(),
        if (stash != null)
        'stash': stash?.toJson(),
    };
}

class RecordStringAny {
    RecordStringAny();

    factory RecordStringAny.fromJson(Map<String, dynamic> json) => RecordStringAny(
    );

    Map<String, dynamic> toJson() => {
    };
}
