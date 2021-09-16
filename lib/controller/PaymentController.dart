import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedPayment = "".obs;

  setPayment(String type) {
    selectedPayment.value = type;
  }
}
