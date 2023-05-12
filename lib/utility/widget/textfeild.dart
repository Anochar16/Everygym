import 'package:flutter/material.dart';

class myFeild {
  
  Container textfeildOutline({required String hint, required double width ,required controll}) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.04, top: 11),
      width: width * 0.5,
      child: TextField(
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.number,
        controller: controll,
      ),
    );
  }

  // Container textFeildNormal(
  //     {required double screenW,
  //     required String hint,
  //     required Icon myIcon,
  //     required feildMargin,required  feild}) {     
  //   return Container(
  //     width: screenW * 0.7,
  //     margin: feildMargin,
  //     child: TextFormField(
  //       autofocus: true,
  //       obscureText: false,
  //       onChanged: (value) => feild = value,
  //       decoration: InputDecoration(
  //         hintText: hint,
  //         prefixIcon: myIcon,
  //         enabledBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Color(0x00000000),
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         focusedBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Color(0x00000000),
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         errorBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Color(0x00000000),
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         focusedErrorBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Color(0x00000000),
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //         filled: true,
  //         fillColor: Color(0xFFDFDEDE),
  //       ),
  //     ),
  //   );
  // }
}
