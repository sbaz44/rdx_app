import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_pill/helper/url.dart';

import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:rdx_app/models/SearchModel.dart';

final _baseUrl = 'https://api.jikan.moe/v3/search/anime?q=';
Dio dioo = Dio();
//  dio instance to request token
Dio tokenDio = Dio();

class DioClient {
  final Dio _dio = Dio();

  Future<SearchModel?> getSearchData(String query) async {
    print("INSIDE REQUEST");
    print(query);
    SearchModel? user;
    try {
      Response userData = await _dio.get(_baseUrl + query);
      print('User Info: ${userData.data}');
      user = SearchModel.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    print("user");
    print(user);
    return user;
  }
}

class GetSearchPost {
  final String query;
  GetSearchPost({
    required this.query,
  });

  Future<SearchModel> getSearchData() async {
    print("object");
    Response userData = await dioo.get(_baseUrl + query);
    print('User Info: ${userData.data}');
    SearchModel _data = SearchModel.fromJson(userData.data);

    // print(_baseUrl + query);
    // Response response = await dioo.get(_baseUrl + query);
    // SearchModel _data = SearchModel.fromJson(response.data);
    // print("response");
    // print(_data);
    // return _data;

    // SearchModel? user;
    // try {
    //   Response userData = await dioo.get(_baseUrl + query);
    //   print('User Info: ${userData.data}');
    //   user = SearchModel.fromJson(userData.data);
    //   // user = userData.data;
    //   print("user...............");
    //   print(user);
    //   return user;
    // } on DioError catch (e) {
    //   // The request was made and the server responded with a status code
    //   // that falls out of the range of 2xx and is also not 304.
    //   if (e.response != null) {
    //     print('Dio error!');
    //     print('STATUS: ${e.response?.statusCode}');
    //     print('DATA: ${e.response?.data}');
    //     print('HEADERS: ${e.response?.headers}');
    //   } else {
    //     // Error due to setting up or sending the request
    //     print('Error sending request!');
    //     print(e.message);
    //   }
    // }
    // print("Returning user");
    // return user;
    print(_data.results);
    // var response = await dioo.get(_baseUrl + query);
    return userData.data;
  }
}

// Future<User?> getUser({required String id}) async {
//   User? user;
//   try {
//     Response userData = await _dio.get(_baseUrl + '/users/$id');
//     print('User Info: ${userData.data}');
//     user = User.fromJson(userData.data);
//   } on DioError catch (e) {
//     // The request was made and the server responded with a status code
//     // that falls out of the range of 2xx and is also not 304.
//     if (e.response != null) {
//       print('Dio error!');
//       print('STATUS: ${e.response?.statusCode}');
//       print('DATA: ${e.response?.data}');
//       print('HEADERS: ${e.response?.headers}');
//     } else {
//       // Error due to setting up or sending the request
//       print('Error sending request!');
//       print(e.message);
//     }
//   }
//   return user;
// }