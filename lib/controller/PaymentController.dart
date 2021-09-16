import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedPayment = "".obs;

  setPayment(String type) {
    print("object.........");
    selectedPayment.value = type;
    print(selectedPayment);
  }
}
