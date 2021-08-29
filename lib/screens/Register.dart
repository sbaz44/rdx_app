import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/Inputbox.dart';
import 'package:rdx_app/controller/RegisterController.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:rdx_app/helper/size_helper.dart';
import 'package:sizer/sizer.dart';

class Register extends StatelessWidget {
  // const Register({Key? key}) : super(key: key);

  final RegisterController _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFAFAFA),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5.h, bottom: 6.h),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/Logo.png',
                          width: 40.w,
                          height: displayHeight(context) * 0.15,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sign up",
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an Account,Its free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Obx(() => Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              ),
                              Text(
                                "User type",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DropdownButton<String>(
                                hint: Text('Choose'),
                                items: <String>['User', 'Developer']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                              Inputbox(
                                controller: _registerController.email,
                                label: "Email",
                                validator:
                                    _registerController.isEmailEmpty.value,
                                focusNode: _registerController.focusEmail,
                              ),
                              Inputbox(
                                controller: _registerController.companyName,
                                label: "Company Name",
                                validator: _registerController
                                    .isCompanyNameEmpty.value,
                                focusNode: _registerController.focusCName,
                              ),
                              Inputbox(
                                controller: _registerController.password,
                                label: "Password",
                                validator:
                                    _registerController.isPasswordEmpty.value,
                                focusNode: _registerController.focusPassword,
                                secure: true,
                              ),
                              Inputbox(
                                controller: _registerController.cpassword,
                                label: "Confirm Password",
                                validator:
                                    _registerController.isCPasswordEmpty.value,
                                secure: true,
                                focusNode: _registerController.focusCPassword,
                              ),
                              // makeInput(label: "Full Name"),
                              // makeInput(label: "User name"),
                              // makeInput(label: "Email"),
                              // makeInput(label: "Company Name"),
                              // makeInput(label: "Password", obsureText: true),
                              // makeInput(label: "Confirm Pasword", obsureText: true),
                            ],
                          )),
                    ),
                    Center(
                      child: MaterialButton(
                          color: Colors.grey[300],
                          splashColor: Colors.white,
                          height: Get.height / 20,
                          minWidth: Get.width / 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            Get.offAndToNamed('/store');
                            // if (_formKey.currentState.validate()) {
                            //   _loginController.apiLogin('app/login', '');
                            // }
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("login");
                          },
                          child: Text(
                            'Log in',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
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
