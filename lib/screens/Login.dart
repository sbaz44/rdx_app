import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rdx_app/components/Button.dart';
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
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/Logo.png',
                    width: 200,
                    height: displayHeight(context) * 0.15,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.06,
                ),

                // _buildChild(getToken.token),
                // SizedBox(
                //   height: displayHeight(context) * 0.08,
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(38, 0, 38, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        Text(
                          "Please sign in to continue.",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: kSecondaryTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                        ),
                        TextFormField(
                          controller: _loginController.username,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              // fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Username',
                              hintStyle: GoogleFonts.roboto(
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
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 0, right: 10),
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.grey),
                                  child: Icon(Icons.person),
                                ),
                              )),
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: kTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (value) => value!.trim().isEmpty
                              ? 'Username is required'
                              : null,
                        ),
                        SizedBox(height: 50),
                        Obx(
                          () => TextFormField(
                            // controller: _loginController.passwordTextController,
                            keyboardType: TextInputType.text,
                            obscureText: _loginController.isHide.value,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.roboto(
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
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 0, right: 10),
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.grey),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  //  _passwordVisible
                                  _loginController.isHide.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _loginController.togglePassword();
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  //  setState(() {
                                  //      _passwordVisible = !_passwordVisible;
                                  //  });
                                },
                              ),
                            ),
                            validator: (value) => value!.trim().isEmpty
                                ? 'Password required'
                                : null,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: kTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Obx(
                        //   () =>
                        //       _buildInvalidandForget(_loginController.isError),
                        // ),

                        SizedBox(height: 1.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: kSecondaryTextColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Button(
                                name: "Submit",
                                callback: () {
                                  if (_formKey.currentState!.validate()) {
                                    _loginController.postLogin('login');
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: kSecondaryTextColor),
                        // style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed("/register");
                              },
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: kTextColor2),
                          ),
                        ],
                      ),
                    ),
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
