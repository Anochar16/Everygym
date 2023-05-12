import 'package:flutter/material.dart';

class myedio {
  Column expRadio(
      List choiceList, double screenW, String groupValue, Function onchanged) {
    return Column(
      children: [
        for (int i = 0; i < choiceList.length; i++)
          Container(
            margin: EdgeInsets.only(left: screenW * 0.05),
            child: Row(
              children: [
                Radio(
                  value: choiceList[i].toString(),
                  groupValue: groupValue,
                  onChanged: (Object? value) {
                    onchanged();
                  },
                  // onChanged: (value) {
                  //   setState(() {
                  //     _setexp = value.toString();
                  //   });
                  // }
                ),
                Text(choiceList[i])
              ],
            ),
          )
      ],
    );
  }
}
