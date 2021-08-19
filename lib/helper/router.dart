import 'package:rdx_app/screens/Login.dart';
import 'package:rdx_app/screens/Dashboard.dart';
import 'package:get/get.dart';
import 'package:rdx_app/screens/Setting.dart';
import 'package:rdx_app/screens/Store.dart';

class Routerr {
  static final route = [
    GetPage(
      name: '/login',
      page: () => Login(),
    ),
    GetPage(
      name: '/device',
      page: () => Dashboard(),
    ),
    GetPage(
      name: '/store',
      page: () => Store(),
    ),
    GetPage(
      name: '/setting',
      page: () => Setting(),
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
