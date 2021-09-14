import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/helper/constants.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String icon;
  final Color? color;
  final bool? isPresent;
  final Function callback;
  const CategoryCard(
      {Key? key,
      required this.name,
      required this.icon,
      this.isPresent = false,
      this.color = kButtonColor,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        width: 90.0,
        // margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: isPresent ?? false ? Color(0xFFEEEEEE) : Color(0xFFFFFFFF),
          // boxShadow: [
          //   BoxShadow(color: Colors.green, spreadRadius: 3),
          // ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  icon,
                  width: 22,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: kSecondaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
