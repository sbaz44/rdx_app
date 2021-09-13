import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inputbox extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? errorText;
  final bool? validator;
  final FocusNode? focusNode;
  final bool? enable;
  final bool? secure;
  const Inputbox(
      {Key? key,
      this.controller,
      this.label = "Label",
      this.errorText = "Cannot be blank",
      this.validator,
      this.focusNode,
      this.secure,
      this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label ?? "Label",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  height: 2)),
          SizedBox(
            height: 5,
          ),
          Container(
            // height: validator == true ? 70 : 50,
            child: TextFormField(
                obscureText: secure ?? false,
                // keyboardType: TextInputType.number,
                // initialValue: ,
                enabled: enable,
                focusNode: focusNode,
                controller: controller,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) => value!.isEmpty ? errorText : null,

                // onFieldSubmitted: ,
                maxLines: 1,
                // decoration: InputDecoration(
                //   contentPadding:
                //       EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: Colors.grey[400]!,
                //     ),
                //   ),
                //   border: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.grey[400]!)),
                // ),
                decoration: InputDecoration(
                    // errorBorder: ,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: new Color(0xFFECEAEA),
                    contentPadding: EdgeInsets.only(left: 8.0),
                    errorText: validator == true ? errorText : null),
                onEditingComplete: () => FocusScope.of(context).nextFocus()),
          )
        ],
      ),
    );
  }
}
