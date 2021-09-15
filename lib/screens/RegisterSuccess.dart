import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/Button.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/login");
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 125),
            color: Colors.white,
            // width: 100.w,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  'assets/success.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Registered Successfully",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: kTextColor2,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Use the access key to register the device.\nThis access key will also b sent to your registered email id",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: kSecondaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    children: [
                      Container(
                        width: 70.w,
                        child: Text(
                          "7dab8b8af1c9e43086f55be1f491688fbabcb624",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(new ClipboardData(
                                  text:
                                      "7dab8b8af1c9e43086f55be1f491688fbabcb624"))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 3),
                                content: Text("Copied to clipboard")));
                          });
                        },
                        child: Icon(
                          Icons.content_copy,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 54, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Button(
                          name: "Sign in",
                          callback: () {
                            Get.toNamed("/login");
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
