import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class ActiveUsecaseCard extends StatelessWidget {
  const ActiveUsecaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90,
        maxWidth: 95.w,
      ),
      child: Container(
        height: 90,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Color(0xFFF8F8F8),
            border: Border.all(width: 2, color: Colors.red)
            // color: kPrimaryColor
            // boxShadow: [
            //   BoxShadow(color: Colors.green, spreadRadius: 3),
            // ],
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          //NETWORK IMAGE WHEN API IS HANDLED
                          image: AssetImage('assets/9.jpg')),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      // borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xFFF8F8F8),
                    )),
                // Image.asset(
                //   'assets/9.jpg',
                //   width: 80,
                //   fit: BoxFit.contain,
                // ),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 35.w,
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
                            text: "Expiry: ",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: kButtonColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: '11/09/2021',
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
                            text: "Duration: ",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: kButtonColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Monthly',
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
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: "Status: ",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: kButtonColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Near Expiry',
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
                          text: "Expiry: ",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: kButtonColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: '11/09/2021',
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
                          text: "",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: kButtonColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: '',
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
                      )
                    ],
                  ),
                )
              ],
            ),
            // Container(
            //   child: MaterialButton(
            //       color: kButtonColor,
            //       splashColor: Colors.white,
            //       height: 26,
            //       minWidth: 70,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //       child: Text(
            //         "Get",
            //         style: GoogleFonts.roboto(
            //           fontSize: 12,
            //           color: Colors.white,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //       onPressed: () {}),
            // )
          ],
        ),
      ),
    );
  }
}
