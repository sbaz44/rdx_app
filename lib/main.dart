import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/helper/constants.dart';
import 'package:rdx_app/helper/router.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            return Sizer(builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                title: 'RDX',
                debugShowCheckedModeBanner: false,
                defaultTransition: Transition.rightToLeftWithFade,
                getPages: Routerr.route,
                initialRoute: '/dashboard',
                theme: ThemeData(
                  // primarySwatch: new Color(0xFF2029A0),
                  primaryColor: kPrimaryColor,
                  appBarTheme: AppBarTheme(
                    color: kPrimaryColor,
                  ),
                ),
              );
            });
            //initialize SizerUtil
          },
        );
      },
    );
  }
}
