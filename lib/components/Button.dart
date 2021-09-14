import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';

class Button extends StatelessWidget {
  final String name;
  final Color? color;
  final Function callback;
  const Button(
      {Key? key,
      required this.name,
      this.color = kButtonColor,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        splashColor: Colors.white,
        height: 50,
        minWidth: Get.width / 2.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          name,
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          callback();
        });
  }
}
