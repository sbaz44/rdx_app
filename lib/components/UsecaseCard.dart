import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class UsecaseCard extends StatelessWidget {
  const UsecaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: 95.w,
      height: 90,
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
            children: <Widget>[
              Image.asset(
                'assets/uc1.png',
                width: 80,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Fire Detection",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Fire, Detection, Safety, Alarm",
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: Color(0xFF26AAA6),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/download.png',
                        width: 10,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4514",
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          color: Color(0xFF26AAA6),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/star.png',
                    width: 80,
                    fit: BoxFit.contain,
                  )
                ],
              )
            ],
          ),
          Container(
            child: MaterialButton(
                color: kButtonColor,
                splashColor: Colors.white,
                height: 26,
                minWidth: 70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  "Get",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
