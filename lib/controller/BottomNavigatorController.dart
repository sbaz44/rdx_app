import 'package:get/get.dart';

class BottomNavigatorController extends GetxController {
  var indexx = 0.obs;
  var deviceIndexx = 1.obs;
  var settingIndexx = 2.obs;

  void prescriptionNavigation(dynamic index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/store');
        indexx(index);
        print(index);
        break;
      case 1:
        print("DEVICE index");
        print(index);
        Get.offAllNamed('/device');
        indexx(index);

        break;
      case 2:
        Get.offAllNamed('/setting');
        indexx(index);
        print("indexx");
        print(indexx);

        break;
      // case 3:
      //   Get.offAllNamed('/setting');
      //   indexx(index);
      //   print(index);
      //   break;
    }
  }
}
