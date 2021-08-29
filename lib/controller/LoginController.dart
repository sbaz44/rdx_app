import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/helper/request.dart';

class LoginController extends GetxController {
  TextEditingController? username;
  TextEditingController? password;

  FocusNode focusUsername = new FocusNode();
  FocusNode focusPassword = new FocusNode();

  var isUserNameEmpty = false.obs;
  var isPasswordEmpty = false.obs;

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();

    focusUsername.addListener(() {
      if (!focusUsername.hasFocus) {
        validateInput("Username");
      }
    });
    super.onInit();
  }

  validateInput(String name) {
    print("object.......................");
    if (name == "Username") {
      if (username!.text.isEmpty)
        isUserNameEmpty.value = true;
      else
        isUserNameEmpty.value = false;
    }
    print("isUserNameEmpty.value");
    print(isUserNameEmpty.value);
  }

  void postLogin(String query) async {
    // var dataa = await _client.getSearchData(query);
    print("object");
    // data = json.decode(json.encode(dataa));
    // print("getResponse?.results");
    // print(data["results"][0]['title']);

    PostLogin request = PostLogin(
      endpoint: query,
    );

    request.postAPI().then((value) {
      print("value");
      print(value);
      // searchResponse.value = value;
      // response.clear();
      // response.addAll(searchResponse.value.results!.toList()); //coded by Dipesh
    }).catchError((onError) {
      print("onError CONTROLLER");
      print(onError);
    });

    // print(jsonEncode(searchResponse));
    // print(data?.birthYear);
    // _client.getSearchData(query).then((value) {
    //   print("value.results");
    //   print(value);
    // });
    // print("object");
    // final response = await _client.getSearchData(query);
    // print("response.results");
    // print(response.results);
    //  Response userData = await _client.getSearchData(query);
    // SearchModel data = searchModelFromJson("data");
    // print("data");
    // print(searchResponse.value.results);
  }
}
