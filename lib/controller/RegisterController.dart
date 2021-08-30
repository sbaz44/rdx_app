import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/request.dart';
import 'package:rdx_app/models/OTP.dart';
import 'package:rdx_app/models/OTPGenratedResponse.dart';
import 'package:sizer/sizer.dart';

class RegisterController extends GetxController {
  // var userType = "User".obs;
  var userType = [].obs;
  var otpGResponse = OtpgResponse().obs;

  String? accessKey = "";
  List<String> userList = [
    "user",
    "developer",
    "Maintenance",
  ];
  TextEditingController? fullName;
  TextEditingController? phone;
  TextEditingController? email;
  TextEditingController? companyName;
  TextEditingController? username;
  TextEditingController? password;
  TextEditingController? cpassword;

  //Focus Node
  FocusNode focusName = new FocusNode();
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPhone = new FocusNode();
  FocusNode focusCName = new FocusNode();
  FocusNode focusUsertype = new FocusNode();
  FocusNode focusUsername = new FocusNode();
  FocusNode focusPassword = new FocusNode();
  FocusNode focusCPassword = new FocusNode();

  //Validation
  var isFullNameEmpty = false.obs;
  var isPhoneEmpty = false.obs;
  var isEmailEmpty = false.obs;
  var isCompanyNameEmpty = false.obs;
  var isUserTypeEmpty = false.obs;
  var isUsernameEmpty = false.obs;
  var isPasswordEmpty = false.obs;
  var isCPasswordEmpty = false.obs;

  @override
  void onInit() {
    fullName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    companyName = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    cpassword = TextEditingController();

    focusName.addListener(() {
      if (!focusName.hasFocus) {
        validateInput("Full Name");
      }
    });

    focusUsername.addListener(() {
      if (!focusUsername.hasFocus) {
        validateInput("Username");
      }
    });

    focusEmail.addListener(() {
      if (!focusEmail.hasFocus) {
        validateInput("Email");
      }
    });

    focusCName.addListener(() {
      if (!focusCName.hasFocus) {
        validateInput("CName");
      }
    });

    focusPassword.addListener(() {
      if (!focusPassword.hasFocus) {
        validateInput("Password");
      }
    });

    focusCPassword.addListener(() {
      if (!focusCPassword.hasFocus) {
        validateInput("CPassword");
      }
    });

    super.onInit();
  }

  void handleCategoryType(String cat) {
    if (userType.contains(cat)) {
      userType.remove(cat);
      return;
    }
    print(cat);
    userType.add(cat);
    print(userType);
  }

  validateInput(String name) {
    if (name == "Full Name") {
      if (fullName!.text.isEmpty)
        isFullNameEmpty.value = true;
      else
        isFullNameEmpty.value = false;
    }

    if (name == "Username") {
      if (username!.text.isEmpty)
        isUsernameEmpty.value = true;
      else
        isUsernameEmpty.value = false;
    }

    if (name == "Email") {
      print("object");
      if (email!.text.isEmpty)
        isEmailEmpty.value = true;
      else
        isEmailEmpty.value = false;

      if (isValidEmail(email!.text))
        isEmailEmpty.value = false;
      else
        isEmailEmpty.value = true;
      print(isEmailEmpty.value);
    }

    if (name == "CName") {
      if (companyName!.text.isEmpty)
        isCompanyNameEmpty.value = true;
      else
        isCompanyNameEmpty.value = false;
    }

    if (name == "Password") {
      if (password!.text.isEmpty)
        isPasswordEmpty.value = true;
      else
        isPasswordEmpty.value = false;
    }

    if (name == "CPassword") {
      if (cpassword!.text.isEmpty)
        isCPasswordEmpty.value = true;
      else
        isCPasswordEmpty.value = false;
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void postData(String query) async {
    PostRegister request = PostRegister();

    var userData = {
      "fullName": fullName?.text,
      "phone": phone?.text,
      "email": email?.text,
      "companyName": companyName?.text,
      "userType": userType,
      "username": username?.text,
      "password": password?.text,
    };
    print(userData);
    request.postAPI(userData).then((value) {
      // otpGResponse.value = value;
      accessKey = value!.accessToken;
      postOTP('otp');
      // Get.bottomSheet(
      //     Container(
      //         height: 8.h,
      //         color: Colors.green[600],
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Center(
      //               child: Text('Registered Successfully!',
      //                   style: GoogleFonts.montserrat(
      //                     fontSize: 15,
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.w400,
      //                   )),
      //             ),
      //           ],
      //         )),
      //     barrierColor: Colors.transparent,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(35),
      //       // side: BorderSide(width: 5, color: Colors.black)
      //     ),
      //     enableDrag: false,
      //     isDismissible: true);
    }).catchError((onError) {
      print("onError CONTROLLER");
      print(onError);
    });
  }

  void postOTP(String query) async {
    PostGenreatedOTP request = PostGenreatedOTP(endpoint: query);
    var rng = new Random();
    var code = rng.nextInt(900000) + 100000;
    var userData = {
      "accessKey": accessKey,
      "username": username!.text,
      "destination": email!.text,
      "otp": code.toString(),
      "interval": "10"
    };
    print(userData);
    request.postAPI(userData).then((value) {
      print("OTP GENERATED RES");
      print(value);
      otpGResponse.value = value!;
      var httpStatusCode = otpGResponse.value.responseMetadata!.httpStatusCode;
      if (httpStatusCode != 200) {
        Get.bottomSheet(
            Container(
                height: 8.h,
                color: Colors.red[400],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Email ID is invalid !',
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
      }
    }).catchError((onError) {
      print("onError CONTROLLER");
      print(onError);
    });
  }

  @override
  void dispose() {
    focusName.dispose();
    focusEmail.dispose();
    focusPhone.dispose();
    focusCName.dispose();
    focusUsertype.dispose();
    focusEmail.dispose();
    focusUsername.dispose();
    focusPassword.dispose();
    focusCPassword.dispose();

    // fullName?.dispose();
    // phone?.dispose();
    // email?.dispose();
    // companyName?.dispose();
    // username?.dispose();
    // password?.dispose();
    // cpassword?.dispose();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
