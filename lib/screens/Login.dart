import 'package:flutter/material.dart';
import 'package:rdx_app/controller/LoginController.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:rdx_app/helper/size_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/Logo.png',
                    width: 400,
                    height: displayHeight(context) * 0.15,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.08,
                ),
                // _buildChild(getToken.token),
                SizedBox(
                  height: displayHeight(context) * 0.08,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(38, 0, 38, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _loginController.username,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            // fillColor: Colors.grey[200],
                            filled: false,
                            hintText: 'Username',
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: new Color(0xFF2029A0),
                                width: 6,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          style: GoogleFonts.exo2(
                            fontSize: 16,
                            color: kTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (value) => value!.trim().isEmpty
                              ? 'Username is required'
                              : null,
                        ),
                        SizedBox(height: 50),
                        TextFormField(
                          // controller: _loginController.passwordTextController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: false,
                            hintText: 'Password',
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: new Color(0xFF2029A0),
                                width: 6,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) => value!.trim().isEmpty
                              ? 'Password required'
                              : null,
                          style: GoogleFonts.exo2(
                            fontSize: 16,
                            color: kTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Obx(
                        //   () =>
                        //       _buildInvalidandForget(_loginController.isError),
                        // ),

                        SizedBox(height: 5.h),
                        Center(
                          child: MaterialButton(
                              color: kButtonColor,
                              splashColor: Colors.white,
                              height: 32,
                              minWidth: Get.width / 2.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                'LOG IN',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _loginController.postLogin('login');
                                }
                              }),
                        ),
                        SizedBox(height: 3.h),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/register");
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 6.w,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Text('Terms & Condition / Privacy Policy'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   child: Center(
      //     child: Text("${getToken.token}"),
      //   ),
      // ),
    );
  }
}

Widget _buildChild(String token) {
  if (token == "patient") {
    return PatientBox();
  } else {
    print("tttoken");
    print(token);
    return GuardianBox();
  }
}

Widget _buildInvalidandForget(RxBool isError) {
  if (isError.value == true) {
    return Error();
  } else {
    return NoError();
  }
}

class NoError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "",
          style: GoogleFonts.montserrat(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
        ),
        Text(
          "Forgot Password ?",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: new Color(0xFF2029A0),
          ),
        ),
      ],
    );
  }
}

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Invalid Mobile or Password",
          style: GoogleFonts.montserrat(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
        ),
        Text(
          "Forgot Password ?",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: new Color(0xFF2029A0),
          ),
        ),
      ],
    );
  }
}

class GuardianBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/nanny.png',
          width: 40.0,
          height: 40.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Guardian / 保護者',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class PatientBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/heart-problem.png',
          width: 40.0,
          height: 40.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Patient / 保護者',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
