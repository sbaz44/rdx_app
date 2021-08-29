// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userType,
  });

  String accessToken;
  String refreshToken;
  List<String> userType;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        userType: List<String>.from(json["userType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "userType": List<dynamic>.from(userType.map((x) => x)),
      };
}
