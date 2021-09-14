import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/CategoryCard.dart';
import 'package:rdx_app/components/UsecaseCard.dart';
import 'package:rdx_app/controller/BottomNavigatorController.dart';
import 'package:rdx_app/controller/StoreController.dart';
import 'package:rdx_app/helper/Search.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class Store extends StatelessWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  final BottomNavigatorController _bottomNav =
      Get.put(BottomNavigatorController());

  final StoreController _storeController = Get.put(StoreController());

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: new Color(0xFFFFFFFF),
        // appBar: AppBar(
        //   backgroundColor: kPrimaryColor,
        //   centerTitle: true,
        //   title: Text('Store',
        //       // style: TextStyle(fontFamily: 'RobotoMono'),
        //       style: GoogleFonts.montserrat(
        //         fontSize: 5.w,
        //         fontWeight: FontWeight.w500,
        //       )),
        // ),
        body: SafeArea(
          child: Container(
            child: new Column(
              children: <Widget>[
                // Container(
                //   color: kBackgroundColor,
                //   alignment: Alignment.center,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Text(
                //       'Store',
                //       style: GoogleFonts.montserrat(
                //         fontSize: 22,
                //         color: Colors.black,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: Search(list));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: kTextColor2,
                        // boxShadow: [
                        //   BoxShadow(color: Colors.green, spreadRadius: 3),
                        // ],
                      ),
                      // color: Colors.red,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 4.w),
                              child: Text(
                                "Search Use Cases",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextField(
                //     onChanged: (value) {},
                //     onTap: () {
                //       showSearch(context: context, delegate: Search(list));
                //     },
                //     // controller: editingController,
                //     decoration: InputDecoration(
                //         labelText: "Search",
                //         hintText: "Search",
                //         prefixIcon: Icon(Icons.search),
                //         border: OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(12.0)))),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Filter',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: <Widget>[
                //       for (var item in _storeController.categoryList)
                //         Obx(
                //           () => Container(
                //             color: _colorFromHex(item['color']),
                //             margin: EdgeInsets.only(left: 10, right: 5),
                //             child: MaterialButton(
                //                 // color: _colorFromHex(item['color']),
                //                 // color: Color(int.parse(
                //                 //     "0xff${item['color'].replaceAll("#", "")}")),
                //                 // color: Colors.white,
                //                 color: _storeController.category.contains(item)
                //                     ? kPrimaryColor
                //                     : kPrimaryColor,
                //                 splashColor: kPrimaryColor,
                //                 height: 32,
                //                 minWidth: Get.width / 4.5,
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15),
                //                 ),
                //                 child: Text(
                //                   item['name'],
                //                   style: GoogleFonts.montserrat(
                //                     fontSize: 13,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.w400,
                //                   ),
                //                 ),
                //                 onPressed: () {
                //                   _storeController
                //                       .handleCategoryType(item['name']);
                //                   // print(catList);
                //                   // if (_formKey.currentState.validate()) {
                //                   //   _loginController.apiLogin('app/login', '');
                //                   // }
                //                 }),
                //           ),
                //         )

                //       //   Image.network(
                //       //       'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
                //       //       width: 300,
                //       //       height: 200,
                //       //       fit: BoxFit.contain),
                //     ],
                //   ),
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        for (var item in _storeController.categoryList)
                          Obx(() => CategoryCard(
                                name: item['name'],
                                color: _colorFromHex(item['color']),
                                icon: item['icon'],
                                isPresent: _storeController.category
                                    .contains(item['name']),
                                callback: () {
                                  _storeController
                                      .handleCategoryType(item['name']);
                                },
                              )),
                      ],
                    ),
                  ),
                ),
                UsecaseCard(),
                Expanded(child: __buildGrid(context)),
                SizedBox(height: 20),
                Expanded(child: __buildGrid(context))
              ],
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
            currentIndex: _bottomNav.storeIndexx.value,
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

  Widget __buildGrid(context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 0.8;
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: 100,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) => ItemTile(index),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
      );
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

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

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'PRODUCT ' + itemNo.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
        // ListTile(
        //   tileColor: color.withOpacity(0.3),
        //   onTap: () {},
        //   leading: Container(
        //     width: 50,
        //     height: 30,
        //     color: color.withOpacity(0.5),
        //     child: Placeholder(
        //       color: color,
        //     ),
        //   ),
        //   title: Text(
        //     'Product $itemNo',
        //     key: Key('text_$itemNo'),
        //   ),
        // ),
        );
  }
}
