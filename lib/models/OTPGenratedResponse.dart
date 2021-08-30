// To parse this JSON data, do
//
//     final otpGenratedResponse = otpGenratedResponseFromJson(jsonString);

import 'dart:convert';

OtpGenratedResponse otpGenratedResponseFromJson(String str) =>
    OtpGenratedResponse.fromJson(json.decode(str));

String otpGenratedResponseToJson(OtpGenratedResponse data) =>
    json.encode(data.toJson());

class OtpGenratedResponse {
  OtpGenratedResponse({
    this.detail,
    this.accessToken,
  });

  String? detail;
  String? accessToken;

  factory OtpGenratedResponse.fromJson(Map<String, dynamic> json) =>
      OtpGenratedResponse(
        detail: json["detail"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "access_token": accessToken,
      };
}
