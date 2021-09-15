import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/controller/BottomNavigatorController.dart';
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
                          onPressed: () {}),
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

  // Widget _buildList() {
  //   return Obx(() => ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         // itemCount: names.length + 1,
  //         itemCount: _alertController.data.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           // if (index == _alertController.data.length) {
  //           //   return _buildProgressIndicator();
  //           // } else {
  //           return AlertCard(_alertController.data[index], index);
  //           // }
  //         },
  //       ));
  // }

  // Widget __buildGrid(context) {
  //   var size = MediaQuery.of(context).size;
  //   final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  //   final double itemWidth = size.width / 0.8;
  //   return LayoutBuilder(builder: (context, constraints) {
  //     return GridView.builder(
  //       itemCount: 100,
  //       primary: false,
  //       shrinkWrap: true,
  //       itemBuilder: (context, index) => ItemTile(index),
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
  //         childAspectRatio: (itemWidth / itemHeight),
  //       ),
  //     );
  //   });
  // }

  // Widget _buildProgressIndicator() {
  //   return new Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: new Center(
  //       child: Opacity(
  //         opacity: 1.0,
  //         child: new CircularProgressIndicator(),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildSearchBox() {
  //   return new Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: new Card(
  //       child: new ListTile(
  //         leading: new Icon(Icons.search),
  //         title: new TextField(
  //           controller: _alertController.searchTextController,
  //           keyboardType: TextInputType.text,
  //           decoration: new InputDecoration(
  //               hintText: 'Search', border: InputBorder.none),
  //           // onChanged: onSearchTextChanged,
  //           onSubmitted: (text) {
  //             print("texttttttttttt");
  //             print(text);
  //           },
  //         ),
  //         trailing: new IconButton(
  //           icon: new Icon(Icons.cancel),
  //           onPressed: () {
  //             _alertController.searchTextController.clear();
  //             // onSearchTextChanged('');
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
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
