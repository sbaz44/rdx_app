import 'package:get/get.dart';

class BottomNavigatorController extends GetxController {
  var indexx = 0.obs;
  var alertIndexx = 1.obs;
  var statsIndexx = 2.obs;
  var settingIndexx = 3.obs;

  void prescriptionNavigation(dynamic index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        indexx(index);
        print(index);
        break;
      case 1:
        Get.offAllNamed('/member');
        indexx(index);
        print(index);

        break;
      case 2:
        Get.offAllNamed('/employee');
        indexx(index);
        print(index);

        break;
      case 3:
        Get.offAllNamed('/setting');
        indexx(index);
        print(index);
        break;
    }
  }
}
