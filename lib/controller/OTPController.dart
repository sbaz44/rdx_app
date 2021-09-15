import 'package:get/get.dart';

class OTPController extends GetxController {
  RxMap data = {}.obs;
  @override
  void onInit() {
    data.value = Get.arguments;
    print("Data");
    print(data['fullName']);
    super.onInit();
  }
}
