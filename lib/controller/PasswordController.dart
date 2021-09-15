import 'package:get/get.dart';

class PasswordController extends GetxController {
  var isOPasswordHide = true.obs;
  var isNPasswordHide = true.obs;
  var isCPasswordHide = true.obs;

  togglePassword(String name) {
    if (name == 'old') isOPasswordHide.value = !isOPasswordHide.value;
    if (name == 'new') isNPasswordHide.value = !isNPasswordHide.value;
    if (name == 'confirm') isCPasswordHide.value = !isCPasswordHide.value;
  }
}
