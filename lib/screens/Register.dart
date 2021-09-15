import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/Button.dart';
import 'package:rdx_app/components/Inputbox.dart';
import 'package:rdx_app/controller/RegisterController.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:rdx_app/helper/size_helper.dart';
import 'package:sizer/sizer.dart';

class UserType {
  final int id;
  final String name;

  UserType({
    required this.id,
    required this.name,
  });
}

class Register extends StatelessWidget {
  // const Register({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final RegisterController _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // decoration: new BoxDecoration(
            //     gradient: new LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color.fromARGB(255, 25, 178, 238),
            //     Color.fromARGB(255, 21, 236, 229)
            //   ],
            // )),
            padding: EdgeInsets.only(top: 1.h, bottom: 6.h),
            width: double.infinity,
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/Logo.png',
                          width: 40.w,
                          height: displayHeight(context) * 0.15,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Obx(() => Form(
                            key: _formKey,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Register",
                                  style: GoogleFonts.roboto(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Inputbox(
                                  controller: _registerController.fullName,
                                  label: "Full Name",
                                  validator:
                                      _registerController.isFullNameEmpty.value,
                                  focusNode: _registerController.focusName,
                                  errorText: "Required",

                                  // initValue: _editProfile.data['ID'],
                                  // focusNode: _editProfile.focusNode,
                                ),
                                Inputbox(
                                  controller: _registerController.username,
                                  label: "User name",
                                  validator:
                                      _registerController.isUsernameEmpty.value,
                                  focusNode: _registerController.focusUsername,
                                  errorText: "Required",
                                ),
                                // Text(
                                //   "User type",
                                //   style: GoogleFonts.montserrat(
                                //       fontSize: 15,
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.normal,
                                //       height: 2),
                                // ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Wrap(
                                //   children: <Widget>[
                                //     for (var item
                                //         in _registerController.userList)
                                //       Obx(
                                //         () => Container(
                                //           // color: Colors.red,
                                //           margin: EdgeInsets.only(
                                //               left: 2, right: 3),
                                //           child: MaterialButton(
                                //               color: _registerController
                                //                       .userType
                                //                       .contains(item)
                                //                   ? kSecondaryColor
                                //                   : Colors.white,
                                //               splashColor: kPrimaryColor,
                                //               height: 32,
                                //               minWidth: Get.width / 4.5,
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(15),
                                //               ),
                                //               child: Text(
                                //                 item,
                                //                 style: GoogleFonts.montserrat(
                                //                   fontSize: 13,
                                //                   color: Colors.black,
                                //                   fontWeight: FontWeight.w400,
                                //                 ),
                                //               ),
                                //               onPressed: () {
                                //                 _registerController
                                //                     .handleCategoryType(item);
                                //               }),
                                //         ),
                                //       )
                                //   ],
                                // ),
                                // DropdownButton<String>(
                                //   value: _registerController.userType.value,
                                //   // hint: Text('Choose'),
                                //   items: <String>['User', 'Developer']
                                //       .map((String value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: new Text(value),
                                //     );
                                //   }).toList(),
                                //   style: GoogleFonts.montserrat(
                                //     fontSize: 16,
                                //     color: Colors.black,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                //   onChanged: (value) {
                                //     _registerController.setUserType(value!);
                                //   },
                                // ),
                                Inputbox(
                                  controller: _registerController.email,
                                  label: "Email",
                                  validator:
                                      _registerController.isEmailEmpty.value,
                                  focusNode: _registerController.focusEmail,
                                  errorText: "Invalid Email Address",
                                ),
                                Inputbox(
                                  controller: _registerController.phone,
                                  label: "Phone",
                                  validator:
                                      _registerController.isPhoneEmpty.value,
                                  focusNode: _registerController.focusPhone,
                                  errorText: "Required",
                                ),
                                Inputbox(
                                  controller: _registerController.companyName,
                                  label: "Company Name",
                                  validator: _registerController
                                      .isCompanyNameEmpty.value,
                                  focusNode: _registerController.focusCName,
                                  errorText: "Required",
                                ),
                                Inputbox(
                                  controller: _registerController.password,
                                  label: "Password",
                                  validator:
                                      _registerController.isPasswordEmpty.value,
                                  focusNode: _registerController.focusPassword,
                                  secure: true,
                                  errorText: "Required",
                                ),
                                Inputbox(
                                  controller: _registerController.cpassword,
                                  label: "Confirm Password",
                                  validator: _registerController
                                      .isCPasswordEmpty.value,
                                  secure: true,
                                  focusNode: _registerController.focusCPassword,
                                  errorText: "Required",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          focusColor: Colors.lightBlue,
                                          activeColor: kTextColor2,
                                          value: _registerController
                                              .isChecked.value,
                                          onChanged: (newValue) {
                                            _registerController
                                                .toggleCheckBox();
                                            // setState(() => rememberMe = newValue);
                                          }),
                                      RichText(
                                        text: TextSpan(
                                          text: "I agree to the ",
                                          style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: kSecondaryTextColor),
                                          // style: DefaultTextStyle.of(context).style,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'terms and conditions',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.toNamed("/register");
                                                },
                                              style: GoogleFonts.roboto(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: kTextColor2),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Button(
                                        name: "Submit",
                                        callback: () {
                                          Get.toNamed("/otp", arguments: {
                                            "fullName": "ASVSDE",
                                            "phone": "7826665457",
                                            "email": "jilmehekko@biyac.com",
                                            "companyName": "companyName?.text1",
                                            "userType": ['user'],
                                            "username": "username5",
                                            "password": "password123",
                                          });
                                          // if (_formKey.currentState!
                                          //     .validate()) {
                                          //   _registerController
                                          //       .postData('register');
                                          // }
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
