// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.status,
    this.message,
    this.data,
    this.accessToken,
    this.tokenType,
    this.statusCode,
  });

  bool? status;
  String? message;
  Data? data;
  String? accessToken;
  String? tokenType;
  int? statusCode;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
    "status_code": statusCode,
  };
}

class Data {
  Data({
    this.userId,
    this.name,
    this.number,
    this.email,
    this.emailVerifiedAt,
    this.userActiveStatus,
    this.userType,
    this.is2FaVerify,
    this.createdAt,
    this.updatedAt,
  });

  int? userId;
  String? name;
  String? number;
  String? email;
  dynamic? emailVerifiedAt;
  int? userActiveStatus;
  int? userType;
  int? is2FaVerify;
  dynamic createdAt;
  dynamic updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    name: json["name"],
    number: json["number"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    userActiveStatus: json["user_active_status"],
    userType: json["user_type"],
    is2FaVerify: json["is_2fa_verify"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "number": number,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "user_active_status": userActiveStatus,
    "user_type": userType,
    "is_2fa_verify": is2FaVerify,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
