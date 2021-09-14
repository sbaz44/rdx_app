import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsecaseIcon extends StatelessWidget {
  const UsecaseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                //NETWORK IMAGE WHEN API IS HANDLED
                image: AssetImage('assets/8.jpg')),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            // borderRadius: BorderRadius.circular(6.0),
            color: Color(0xFFF8F8F8),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 45,
                  ),
                  child: Container(
                    height: 22,
                    padding: EdgeInsets.only(top: 1.5, left: 3, right: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6)),
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 90,
          margin: EdgeInsets.only(top: 5),
          child: Text(
            "Animal Detection",
            style: GoogleFonts.roboto(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
