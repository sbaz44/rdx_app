import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_pill/helper/url.dart';

import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;

Dio dio = Dio();
Dio dioo = Dio();
//  dio instance to request token
Dio tokenDio = Dio();
