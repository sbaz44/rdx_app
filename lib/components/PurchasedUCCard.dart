import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class PurchasedUCCard extends StatelessWidget {
  final Function callback;

  const PurchasedUCCard({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 90,
            maxWidth: 95.w,
          ),
          child: Stack(
            children: [
              Container(
                height: 90,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Color(0xFFF8F8F8),
                  // color: kPrimaryColor
                  // boxShadow: [
                  //   BoxShadow(color: Colors.green, spreadRadius: 3),
                  // ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  //NETWORK IMAGE WHEN API IS HANDLED
                                  image: AssetImage('assets/4.jpg')),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              // borderRadius: BorderRadius.circular(6.0),
                              color: Color(0xFFF8F8F8),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 50.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    text: "Name: ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: kButtonColor),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Weapon Detection',
                                        // recognizer: TapGestureRecognizer()
                                        //   ..onTap = () {
                                        //     Get.toNamed("/register");
                                        //   },
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: kButtonColor),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Available License: ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: kButtonColor),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '4',
                                        // recognizer: TapGestureRecognizer()
                                        //   ..onTap = () {
                                        //     Get.toNamed("/register");
                                        //   },
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: kButtonColor),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Author: ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: kButtonColor),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Dipesh Adekar',
                                        // recognizer: TapGestureRecognizer()
                                        //   ..onTap = () {
                                        //     Get.toNamed("/register");
                                        //   },
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: kButtonColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                        color: Colors.white,
                        splashColor: kTextColor,
                        height: 45,
                        minWidth: 45,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: kTextColor2,
                        ),
                        onPressed: () {
                          callback();
                        }),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.only(top: 1.5, left: 3, right: 3),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.2),
                  //   borderRadius: BorderRadius.only(
                  //       topRight: Radius.circular(6),
                  //       bottomLeft: Radius.circular(6)),
                  // ),
                  child: Text(
                    "Use case already exists",
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
