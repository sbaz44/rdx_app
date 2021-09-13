import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/request.dart';
import 'package:rdx_app/models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginController extends GetxController {
  var loginResponse = LoginResponseModel().obs;
  var isHide = false.obs;

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

    focusPassword.addListener(() {
      if (!focusPassword.hasFocus) {
        validateInput("Password");
      }
    });
    super.onInit();
  }

  togglePassword() {
    isHide.value = !isHide.value;
  }

  validateInput(String name) {
    if (name == "Username") {
      if (username!.text.isEmpty)
        isUserNameEmpty.value = true;
      else
        isUserNameEmpty.value = false;
    }

    if (name == "Password") {
      if (password!.text.isEmpty)
        isPasswordEmpty.value = true;
      else
        isPasswordEmpty.value = false;
    }
  }

  void postLogin(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var dataa = await _client.getSearchData(query);
    // data = json.decode(json.encode(dataa));
    // print("getResponse?.results");
    // print(data["results"][0]['title']);

    PostLogin request = PostLogin(
      endpoint: query,
    );

    request.postAPI().then((value) {
      loginResponse.value = value;
      prefs.setStringList('role', loginResponse.value.userType ?? []);
      prefs.setString('accessToken', loginResponse.value.accessToken ?? "");
      prefs.setString('refreshToken', loginResponse.value.refreshToken ?? "");
      Get.offAndToNamed('/store');

      // var accessToken = prefs.getString('accessToken');
      // var refreshToken = prefs.getString('refreshToken');
      // response.clear();
      // response.addAll(searchResponse.value.results!.toList()); //coded by Dipesh
    }).catchError((onError) {
      print("onError CONTROLLER");
      print(onError);
      Get.bottomSheet(
          Container(
              height: 8.h,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Invalid Username or Password!',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              )),
          barrierColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            // side: BorderSide(width: 5, color: Colors.black)
          ),
          enableDrag: false,
          isDismissible: true);
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
