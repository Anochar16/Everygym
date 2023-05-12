import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/drawer/countdown.dart';
import 'package:everygym/utility/widget/drawer/edit_profire.dart';
import 'package:everygym/utility/widget/drawer/login.dart';
import 'package:everygym/utility/widget/drawer/signout.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  late double screenW, screenH;
  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: screenH * 0.05, left: screenW * 0.04),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 26, color: Colors.black),
            )),

        ShowAccount(),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: screenH * 0.03, left: screenW * 0.04),
            child: Text(
              'Setting',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
        divider(),
        EditProfile(),
        CountDown(),
        SignOut()
      ],
    );
  }
}


