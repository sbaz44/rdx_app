import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController? fullName;
  TextEditingController? phone;
  TextEditingController? email;
  TextEditingController? companyName;
  TextEditingController? userType;
  TextEditingController? username;
  TextEditingController? password;
  TextEditingController? cpassword;

  //Focus Node
  FocusNode focusName = new FocusNode();
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPhone = new FocusNode();
  FocusNode focusCName = new FocusNode();
  FocusNode focusUsertype = new FocusNode();
  FocusNode focusUsername = new FocusNode();
  FocusNode focusPassword = new FocusNode();
  FocusNode focusCPassword = new FocusNode();

  //Validation
  var isFullNameEmpty = false.obs;
  var isPhoneEmpty = false.obs;
  var isEmailEmpty = false.obs;
  var isCompanyNameEmpty = false.obs;
  var isUserTypeEmpty = false.obs;
  var isUsernameEmpty = false.obs;
  var isPasswordEmpty = false.obs;
  var isCPasswordEmpty = false.obs;

  @override
  void onInit() {
    fullName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    companyName = TextEditingController();
    userType = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    cpassword = TextEditingController();

    focusName.addListener(() {
      if (!focusName.hasFocus) {
        validateInput("Full Name");
      }
    });
    super.onInit();
  }

  validateInput(String name) {
    print("object.......................");
    if (name == "Full Name") {
      if (fullName!.text.isEmpty)
        isFullNameEmpty.value = true;
      else
        isFullNameEmpty.value = false;
    }
    print("isFullNameEmpty.value");
    print(isFullNameEmpty.value);
    // if (name == "Last Name") {
    //   if (lastName.text.isEmpty)
    //     isLastNameEmpty.value = true;
    //   else
    //     isLastNameEmpty.value = false;
    // }
    // if (name == "Flat No.") {
    //   if (address1.text.isEmpty)
    //     isAddress1Empty.value = true;
    //   else
    //     isAddress1Empty.value = false;
    // }
    // if (name == "Building name, Street name, Area, City") {
    //   if (address2.text.isEmpty)
    //     isAddress2Empty.value = true;
    //   else
    //     isAddress2Empty.value = false;
    // }
    // if (name == "Contact No.") {
    //   if (contactNo.text.isEmpty)
    //     isContactEmpty.value = true;
    //   else if (contactNo.text.length != 10) {
    //     isContactEmpty.value = true;
    //   } else
    //     isContactEmpty.value = false;
    // }
    // if (name == "Email ID") {
    //   if (email.text.isEmpty)
    //     isEmailEmpty.value = true;
    //   else
    //     isEmailEmpty.value = false;
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusName.dispose();
    focusEmail.dispose();
    focusPhone.dispose();
    focusCName.dispose();
    focusUsertype.dispose();
    focusEmail.dispose();
    focusUsername.dispose();
    focusPassword.dispose();
    focusCPassword.dispose();

    fullName?.dispose();
    phone?.dispose();
    userType?.dispose();
    email?.dispose();
    companyName?.dispose();
    username?.dispose();
    password?.dispose();
    cpassword?.dispose();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
