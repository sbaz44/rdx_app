import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/components/LicenseOptionSheet.dart';
import 'package:sizer/sizer.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Usecase extends StatelessWidget {
  const Usecase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                //NETWORK IMAGE WHEN API IS HANDLED
                                image: AssetImage('assets/6.jpg')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            // borderRadius: BorderRadius.circular(6.0),
                            color: Color(0xFFF8F8F8),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fire Detection",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Fire, Detection, Safety, Alarm",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  color: Color(0xFF26AAA6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          MaterialButton(
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
                              onPressed: () {
                                _showMyBottomSheet();
                              })
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 40, bottom: 35),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: kBackgroundColor2,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Text(
                                  "4215",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF242414),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Total Downloads",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF242414),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Text(
                                  "Dipesh Adekar",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF26AAA6),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Developer",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFF26AAA6),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Text(
                                  "87 MB",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFF13B2E),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Size",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFF13B2E),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            _divider(),
                            Column(
                              children: [
                                Image.asset('assets/star.png'),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Rating",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: kTextColor2,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 25,
      width: 2,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 25, right: 25),
    );
  }

  void _showMyBottomSheet() {
    Get.bottomSheet(LicenseOptionSheet());
  }
}
