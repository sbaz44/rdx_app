// LicenseOptionSheet
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rdx_app/components/Button.dart';
import 'package:rdx_app/controller/PaymentController.dart';
import 'package:rdx_app/helper/constants.dart';

class LicenseOptionSheet extends StatelessWidget {
  final PaymentController _paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5, right: 10, left: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                size: 30,
              ),
            ),
            alignment: Alignment.topRight,
          ),
          Row(
            children: [
              Image.asset(
                'assets/uc1.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fire Detection",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Dipesh Adekar",
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: Color(0xFF26AAA6),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fire Detection",
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          for (var item in ["Monthly", "Quarterly", "Yearly", "Lifetime"])
            _buildList(item),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Button(
                  name: "Submit",
                  callback: () {
                    Get.toNamed("/otp", arguments: {
                      "fullName": "ASVSDE",
                      "phone": "7826665457",
                      "email": "jilmehekko@biyac.com",
                      "companyName": "companyName?.text1",
                      "userType": ['user'],
                      "username": "username5",
                      "password": "password123",
                    });
                    // if (_formKey.currentState!
                    //     .validate()) {
                    //   _registerController
                    //       .postData('register');
                    // }
                  }),
            ],
          )
        ],
      ),
    ); // return your bottomSheetLayout
  }

  Widget _buildList(String text) {
    return GestureDetector(
      onTap: () {
        _paymentController.setPayment(text);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            // color: kTextColor2,
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
            // boxShadow: [
            //   BoxShadow(color: Colors.green, spreadRadius: 3),
            // ],
            ),
        padding: EdgeInsets.only(top: 5, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: kTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(() => Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: _paymentController.selectedPayment.value == text
                          ? kTextColor2
                          : Colors.transparent,
                      border: Border.all(
                          width:
                              _paymentController.selectedPayment.value == text
                                  ? 1
                                  : 0,
                          color:
                              _paymentController.selectedPayment.value == text
                                  ? Colors.transparent
                                  : Color(0xFF26AAA6))),
                )),
          ],
        ),
      ),
    );
  }
}
