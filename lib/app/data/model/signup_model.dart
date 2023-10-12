import 'dart:convert';

/// success : true
/// data : {"otp":"0000","mobile_number":"8206116356"}
/// message : "User signed up successfully"

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.success,
    this.data,
    this.message,
    this.errors,
  });

  SignupModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? SignupData.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
  }

  bool? success;
  SignupData? data;
  String? message;
  List<Errors>? errors;

  SignupModel copyWith({
    bool? success,
    SignupData? data,
    String? message,
    List<Errors>? errors,
  }) =>
      SignupModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        errors: errors ?? this.errors,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// otp : "0000"
/// mobile_number : "8206116356"

SignupData dataFromJson(String str) => SignupData.fromJson(json.decode(str));

String dataToJson(SignupData data) => json.encode(data.toJson());

Errors errorsFromJson(String str) => Errors.fromJson(json.decode(str));

String errorsToJson(Errors data) => json.encode(data.toJson());

class Errors {
  Errors({
    this.type,
    this.value,
    this.msg,
    this.path,
    this.location,
  });

  Errors.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
    msg = json['msg'];
    path = json['path'];
    location = json['location'];
  }

  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;

  Errors copyWith({
    String? type,
    String? value,
    String? msg,
    String? path,
    String? location,
  }) =>
      Errors(
        type: type ?? this.type,
        value: value ?? this.value,
        msg: msg ?? this.msg,
        path: path ?? this.path,
        location: location ?? this.location,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    map['msg'] = msg;
    map['path'] = path;
    map['location'] = location;
    return map;
  }
}

class SignupData {
  SignupData({
    this.otp,
    this.mobileNumber,
  });

  SignupData.fromJson(dynamic json) {
    otp = json['otp'];
    mobileNumber = json['mobile_number'];
  }

  String? otp;
  String? mobileNumber;

  SignupData copyWith({
    String? otp,
    String? mobileNumber,
  }) =>
      SignupData(
        otp: otp ?? this.otp,
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = otp;
    map['mobile_number'] = mobileNumber;
    return map;
  }
}
