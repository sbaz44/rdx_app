import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/Button.dart';
import 'package:rdx_app/controller/BottomNavigatorController.dart';
import 'package:rdx_app/helper/animated_dialog.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class Setting extends StatelessWidget {
  final BottomNavigatorController _bottomNav =
      Get.put(BottomNavigatorController());

  // final AlertController _alertController = Get.put(AlertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: new Color(0xFFF7F7F7),
        body: Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              padding:
                  EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SettingTile("Personal Information", () {
                    print("object");
                  }),
                  Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                kBackgroundColor2, // This is what you need!
                          ),
                          onPressed: () {},
                          child: Obx(() => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _bottomNav.isAccess.value
                                        ? "Access Key"
                                        : "7dab8b8af1c9e43086f55be1f491688fbabcb624",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _bottomNav.toggleAccess();
                                    },
                                    child: Icon(
                                      // Based on passwordVisible state choose the icon
                                      //  _passwordVisible
                                      _bottomNav.isAccess.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  )
                                ],
                              )))),
                  SettingTile("Change Password", () {
                    Get.toNamed("/password");
                  }),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: MaterialButton(
                          color: Color(0xFFF13B2E),
                          splashColor: Colors.white,
                          height: 50,
                          minWidth: Get.width,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "Sign Out",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            openConfirmationBox(context);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 9.h,
          child: BottomNavigationBar(
            backgroundColor: Color(0xFFF3F3F3),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kTextColor2,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: new Image.asset('assets/dash_inactive.png'),
                activeIcon: new Image.asset('assets/dash_active.png'),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('assets/device_inactive.png'),
                activeIcon: new Image.asset('assets/device_active.png'),
                label: 'Manage device',
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('assets/store_inactive.png'),
                activeIcon: new Image.asset('assets/store_active.png'),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('assets/noti_inactive.png'),
                activeIcon: new Image.asset('assets/noti_active.png'),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: new Image.asset('assets/setting_inactive.png'),
                activeIcon: new Image.asset('assets/setting_active.png'),
                label: 'Setting',
              ),
            ],
            currentIndex: _bottomNav.settingIndexx.value,
            onTap: (index) {
              // print(index);
              _bottomNav.prescriptionNavigation(index);
            },
            selectedFontSize: 13.0,
            unselectedFontSize: 13.0,
          ),
        ));
  }

  openConfirmationBox(context) {
    return showNewDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            // title: Text("Bounce In"),
            content: Container(
              height: 130,
              width: 350,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        child: Icon(Icons.close)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: Text(
                          "Are you sure?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: kButtonColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Button(
                              name: "No",
                              callback: () {
                                Navigator.pop(context, false);
                              },
                              widthh: Get.width / 3.8,
                            ),
                            Button(
                              name: "Yes",
                              callback: () {
                                Get.offAndToNamed('/login');
                              },
                              widthh: Get.width / 3.8,
                            )
                          ],
                        ),
                      )
                      // Center(child: Button(name: "Submit", callback: () {}))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class SettingTile extends StatelessWidget {
  final String name;
  final Function callback;
  const SettingTile(this.name, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kBackgroundColor2, // This is what you need!
            ),
            onPressed: () {
              callback();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  'assets/arrow.png',
                  width: 15,
                  fit: BoxFit.contain,
                )
              ],
            )));
  }
}
