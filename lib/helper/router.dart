import 'package:rdx_app/screens/ChangePassword.dart';
import 'package:rdx_app/screens/Devices.dart';
import 'package:rdx_app/screens/HomePage.dart';
import 'package:rdx_app/screens/Login.dart';
import 'package:rdx_app/screens/Dashboard.dart';
import 'package:get/get.dart';
import 'package:rdx_app/screens/Notification.dart';
import 'package:rdx_app/screens/OTP.dart';
import 'package:rdx_app/screens/Register.dart';
import 'package:rdx_app/screens/RegisterSuccess.dart';
import 'package:rdx_app/screens/SearchResult.dart';
import 'package:rdx_app/screens/Setting.dart';
import 'package:rdx_app/screens/Store.dart';

class Routerr {
  static final route = [
    GetPage(
      name: '/login',
      page: () => Login(),
    ),
    GetPage(
      name: '/register',
      page: () => Register(),
    ),
    GetPage(
      name: '/password',
      page: () => ChangePassword(),
    ),
    GetPage(
      name: '/otp',
      page: () => OTP(),
    ),
    GetPage(
      name: '/success',
      page: () => RegisterSuccess(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => Dashboard(),
    ),
    GetPage(
      name: '/devices',
      page: () => Devices(),
    ),
    GetPage(
      name: '/notification',
      page: () => Notification(),
    ),
    GetPage(
      name: '/store',
      page: () => Store(),
    ),
    GetPage(
      name: '/setting',
      page: () => Setting(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/search',
      page: () => SearchResult(),
    ),
    // GetPage(
    //   name: '/signIn',
    //   page: () => SignIn(),
    // ),
    // GetPage(
    //   name: '/prescription',
    //   page: () => Prescription(),
    // ),
    // GetPage(
    //   name: '/alert',
    //   page: () => Alert(),
    // ),
    // GetPage(
    //   name: '/viewpres',
    //   page: () => ViewPrescription(),
    // ),
    // GetPage(
    //   name: '/setting',
    //   page: () => Setting(),
    // ),
    // GetPage(
    //   name: '/manageguardian',
    //   page: () => ManageGuardian(),
    // ),
    // GetPage(
    //   name: '/addguardian',
    //   page: () => AddGuardian(),
    // ),
    // GetPage(
    //   name: '/profile',
    //   page: () => EditProfile(),
    // ),
    // GetPage(
    //   name: '/statistics',
    //   page: () => Statistics(),
    // ),
    // GetPage(
    //   name: '/configure',
    //   page: () => ConfigureDevice(),
    // ),
    // GetPage(
    //   name: '/guardianprescription',
    //   page: () => GuardianPrescription(),
    // ),
    // GetPage(
    //   name: '/guardianprofile',
    //   page: () => GuardianEditProfile(),
    // ),
    // GetPage(
    //   name: '/managepatient',
    //   page: () => ManagePatient(),
    // )
  ];
}
