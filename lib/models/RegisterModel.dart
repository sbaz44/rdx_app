// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.companyName,
    required this.userType,
    required this.username,
    required this.password,
  });

  String fullName;
  String phone;
  String email;
  String companyName;
  List<String> userType;
  String username;
  String password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        fullName: json["fullName"],
        phone: json["phone"],
        email: json["email"],
        companyName: json["companyName"],
        userType: List<String>.from(json["userType"].map((x) => x)),
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "companyName": companyName,
        "userType": List<dynamic>.from(userType.map((x) => x)),
        "username": username,
        "password": password,
      };
}
