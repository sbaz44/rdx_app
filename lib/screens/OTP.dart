import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/controller/OTPController.dart';
import 'package:rdx_app/controller/RegisterController.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class OTP extends StatelessWidget {
  final OTPController _OTPController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kPrimaryColor,
        backgroundColor: Color(0xFFFAFAFA),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                height: 60.h,
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPDigitTextFieldBox(first: true, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: true),
                    ],
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
                      // Get.offAndToNamed('/store');
                      // if (_formKey.currentState.validate()) {
                      //   _loginController.apiLogin('app/login', '');
                      // }
                    }),
              ),
            ],
          )),
        ));
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {Key? key, required this.first, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 50,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
            print(value);
          }
          if (value.length == 0 && first == false) {
            print(value);
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        // style: MyStyles.inputTextStyle,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(10)),
          hintText: "",
          // hintStyle: MyStyles.hintTextStyle,
        ),
      ),
    );
  }
}
