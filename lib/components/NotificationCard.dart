// NotificationCard
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 60,
            maxWidth: 95.w,
          ),
          child: Container(
            height: 60,
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 16),
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
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              //NETWORK IMAGE WHEN API IS HANDLED
                              image: AssetImage('assets/uc1.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          // borderRadius: BorderRadius.circular(6.0),
                          color: Color(0xFFF8F8F8),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 50.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Fire Detected',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: kButtonColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Alert Time: 14:22:40',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: kButtonColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Alert Date: 14-08-21',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: kButtonColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                    color: Color(0xFF242414),
                    splashColor: kTextColor2,
                    height: 32,
                    minWidth: 20,
                    // shape: CircleBorder(),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
