import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/controller/PasswordController.dart';
import 'package:rdx_app/helper/constants.dart';

class ChangePassword extends StatelessWidget {
  final PasswordController _passwordController = Get.put(PasswordController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Password",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Obx(() => Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            // controller: _passwordController.passwordTextController,
                            keyboardType: TextInputType.text,
                            obscureText:
                                _passwordController.isOPasswordHide.value,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Enter Old Password',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 6,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  //  _passwordVisible
                                  _passwordController.isOPasswordHide.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _passwordController.togglePassword('old');
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
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            // controller: _passwordController.passwordTextController,
                            keyboardType: TextInputType.text,
                            obscureText:
                                _passwordController.isNPasswordHide.value,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Enter New Password',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 6,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  //  _passwordVisible
                                  _passwordController.isNPasswordHide.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _passwordController.togglePassword('new');
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
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            // controller: _passwordController.passwordTextController,
                            keyboardType: TextInputType.text,
                            obscureText:
                                _passwordController.isCPasswordHide.value,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Confirm New Password',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 6,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  //  _passwordVisible
                                  _passwordController.isCPasswordHide.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _passwordController.togglePassword('confirm');
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
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
