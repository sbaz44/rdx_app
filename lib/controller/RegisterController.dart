import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:rdx_app/helper/request.dart';
import 'package:rdx_app/models/OTP.dart';
import 'package:sizer/sizer.dart';

class RegisterController extends GetxController {
  // var userType = "User".obs;
  var userType = [].obs;
  var concatOTP = "";
  var code = 0;
  var otpGResponse = OtpgResponse().obs;
  final _formKey = GlobalKey<FormState>();
  var isChecked = false.obs;

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

  TextEditingController? oTP1;
  TextEditingController? oTP2;
  TextEditingController? oTP3;
  TextEditingController? oTP4;
  TextEditingController? oTP5;
  TextEditingController? oTP6;

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

    oTP1 = TextEditingController();
    oTP2 = TextEditingController();
    oTP3 = TextEditingController();
    oTP4 = TextEditingController();
    oTP5 = TextEditingController();
    oTP6 = TextEditingController();

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

  toggleCheckBox() {
    isChecked.value = !isChecked.value;
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void postData(String query) async {
    PostRegister request = PostRegister();

    var userData = {
      // "fullName": fullName?.text,
      // "phone": phone?.text,
      // "email": email?.text,
      // "companyName": companyName?.text,
      // "userType": userType,
      // "username": username?.text,
      // "password": password?.text,
      "fullName": "fullName?.text1",
      "phone": "7826665457",
      "email": "jilmehekko@biyac.com",
      "companyName": "companyName?.text1",
      "userType": ['user'],
      "username": "username5",
      "password": "password123",
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
    code = rng.nextInt(900000) + 100000;
    var userData = {
      "accessKey": accessKey,
      "username": "username5",
      "destination": "jilmehekko@biyac.com",
      // "username": username!.text,
      // "destination": email!.text,
      "otp": code.toString(),
      "interval": "10"
    };
    print(userData);
    request.postAPI(userData).then((value) {
      print("OTP GENERATED RES");
      print(value);
      otpGResponse.value = value!;
      var httpStatusCode =
          otpGResponse.value.detail!.responseMetadata.httpStatusCode;
      print("httpStatusCode");
      print(httpStatusCode);
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
      } else
        bottomSheet();
    }).catchError((onError) {
      print("onError CONTROLLERRRRR");
      print(onError);
    });
  }

  void bottomSheet() {
    Get.bottomSheet(
        Container(
          height: 80.h,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("A OTP has been sent to provided email address",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 15.h,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Wrap(
                      spacing: 10,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OTPDigitTextFieldBox(
                          first: true,
                          index: 1,
                          last: false,
                          controller: oTP1,
                          callback: (v, i) => setOTP(v, i),
                        ),
                        OTPDigitTextFieldBox(
                          first: false,
                          index: 2,
                          controller: oTP2,
                          last: false,
                          callback: (v, i) => setOTP(v, i),
                        ),
                        OTPDigitTextFieldBox(
                          first: false,
                          index: 3,
                          last: false,
                          controller: oTP3,
                          callback: (v, i) => setOTP(v, i),
                        ),
                        OTPDigitTextFieldBox(
                          index: 4,
                          first: false,
                          last: false,
                          controller: oTP4,
                          callback: (v, i) => setOTP(v, i),
                        ),
                        OTPDigitTextFieldBox(
                          first: false,
                          last: false,
                          index: 5,
                          controller: oTP5,
                          callback: (v, i) => setOTP(v, i),
                        ),
                        OTPDigitTextFieldBox(
                          first: false,
                          index: 6,
                          last: true,
                          controller: oTP6,
                          callback: (v, i) => setOTP(v, i),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: MaterialButton(
                    color: kPrimaryColor,
                    splashColor: Colors.white,
                    height: Get.height / 20,
                    minWidth: Get.width / 2.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Validate',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        concatOTP = oTP1!.text +
                            oTP2!.text +
                            oTP3!.text +
                            oTP4!.text +
                            oTP5!.text +
                            oTP6!.text;
                        print(concatOTP);
                        if (concatOTP == code.toString()) {
                          print("OTP MATCHED");
                        }
                        // _loginController.apiLogin('app/login', '');
                      }
                    }),
              ),
            ],
          ),
        ),
        barrierColor: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          // side: BorderSide(width: 5, color: Colors.black)
        ),
        enableDrag: false,
        isDismissible: false);
  }

  setOTP(String? value, int? index) {
    if (index == 1) oTP1!.text = value!;
    if (index == 2) oTP2!.text = value!;
    if (index == 3) oTP3!.text = value!;
    if (index == 4) oTP4!.text = value!;
    if (index == 5) oTP5!.text = value!;
    if (index == 6) oTP6!.text = value!;
    return "null";
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

    fullName?.dispose();
    phone?.dispose();
    email?.dispose();
    companyName?.dispose();
    username?.dispose();
    password?.dispose();
    cpassword?.dispose();

    oTP1?.dispose();
    oTP2?.dispose();
    oTP3?.dispose();
    oTP4?.dispose();
    oTP5?.dispose();
    oTP6?.dispose();
    super.dispose();
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  final TextEditingController? controller;
  final Function callback;
  final int index;
  const OTPDigitTextFieldBox(
      {Key? key,
      required this.first,
      required this.last,
      required this.index,
      required this.callback,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: 50,
        child: TextFormField(
          autofocus: true,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          validator: (value) => value!.isEmpty ? "" : null,
          controller: controller,
          onChanged: (value) {
            callback(value, index);
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          // style: MyStyles.inputTextStyle,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                //change border of enable textfield
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                //focus boarder
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.orange),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.black)),
              isDense: true,
              counterText: "",
              contentPadding: EdgeInsets.fromLTRB(
                  10, 20, 10, 0), //padding according to your need
              hintStyle: TextStyle(color: Colors.red, fontSize: 13)),
        )
        // decoration: InputDecoration(

        //   errorBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: Colors.red),
        //       borderRadius: BorderRadius.circular(10)),
        //   // contentPadding: EdgeInsets.all(0),
        //   counter: Offstage(),
        //   enabledBorder: OutlineInputBorder(
        //       borderSide: BorderSide(width: 2, color: kPrimaryColor),
        //       borderRadius: BorderRadius.circular(10)),
        //   focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(width: 2, color: kPrimaryColor),
        //       borderRadius: BorderRadius.circular(10)),
        //   hintText: "",
        //   // hintStyle: MyStyles.hintTextStyle,
        // ),
        );
  }
}
