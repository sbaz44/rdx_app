// To parse this JSON data, do
//
//     final otpgResponse = otpgResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpgResponse otpgResponseFromJson(String str) =>
    OtpgResponse.fromJson(json.decode(str));

String otpgResponseToJson(OtpgResponse data) => json.encode(data.toJson());

class OtpgResponse {
  OtpgResponse({
    this.messageId,
    this.responseMetadata,
  });

  String? messageId;
  ResponseMetadata? responseMetadata;

  factory OtpgResponse.fromJson(Map<String, dynamic> json) => OtpgResponse(
        messageId: json["MessageId"],
        responseMetadata: ResponseMetadata.fromJson(json["ResponseMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "MessageId": messageId,
        "ResponseMetadata": responseMetadata!.toJson(),
      };
}

class ResponseMetadata {
  ResponseMetadata({
    this.requestId,
    this.httpStatusCode,
    this.httpHeaders,
    this.retryAttempts,
  });

  String? requestId;
  int? httpStatusCode;
  HttpHeaders? httpHeaders;
  int? retryAttempts;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) =>
      ResponseMetadata(
        requestId: json["RequestId"],
        httpStatusCode: json["HTTPStatusCode"],
        httpHeaders: HttpHeaders.fromJson(json["HTTPHeaders"]),
        retryAttempts: json["RetryAttempts"],
      );

  Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "HTTPStatusCode": httpStatusCode,
        "HTTPHeaders": httpHeaders!.toJson(),
        "RetryAttempts": retryAttempts,
      };
}

class HttpHeaders {
  HttpHeaders({
    this.date,
    this.contentType,
    this.contentLength,
    this.connection,
    this.xAmznRequestid,
  });

  String? date;
  String? contentType;
  String? contentLength;
  String? connection;
  String? xAmznRequestid;

  factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
        date: json["date"],
        contentType: json["content-type"],
        contentLength: json["content-length"],
        connection: json["connection"],
        xAmznRequestid: json["x-amzn-requestid"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "content-type": contentType,
        "content-length": contentLength,
        "connection": connection,
        "x-amzn-requestid": xAmznRequestid,
      };
}
