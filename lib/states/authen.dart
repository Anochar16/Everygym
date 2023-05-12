import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/states/createAccount.dart';
import 'package:everygym/utility/widget/dialog.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  late double screenW, screenH;
  bool redEye = true;
  String? email, password;

  Future<Null> checkAccount() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) => Navigator.pushNamed(context, '/trainning'))
        .catchError(
            (onError) =>dialog().normalDialog(context, onError.code, onError.message));
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      myStyle().myBackground(screenW: screenW, screenH: screenH),
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            child: Text('Login',
                style: textStyle().textheightlight(fontSize: screenW * 0.15))),
        textFeildNormal(),
        passwordFeild(),
        loginButton(context),
        Text(
          'Or',
          style: textStyle().textheightlight(fontSize: screenW * 0.04),
        ),
        skipButton(context),
      ])),
      Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: screenH * 0.05),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Don’t have ac account ?',
              style: textStyle().textheightlight(fontSize: screenW * 0.03),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/createAccount'),
              child: Text(
                'SIGN UP ',
                style: TextStyle(
                    fontSize: screenW * 0.04,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]))
    ]));
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          checkAccount();
        },
        child: Container(
            width: screenW * 0.4,
            alignment: Alignment.center,
            child: Text("Login")));
  }

  ElevatedButton skipButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/anonymous', (route) => false);
        },
        child: Container(
            width: screenW * 0.4,
            alignment: Alignment.center,
            child: Text("Skip")));
  }

  Container passwordFeild() {
    return Container(
      width: screenW * 0.7,
      margin: EdgeInsets.only(top: screenH * 0.01),
      child: TextFormField(
        autofocus: true,
        obscureText: redEye,
        onChanged: (value) => password = value,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.password_outlined),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  redEye = !redEye;
                  print(redEye);
                });
              },
              icon: Icon(Icons.remove_red_eye_outlined)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          filled: true,
          fillColor: Color(0xFFDFDEDE),
        ),
      ),
    );
  }

  Container textFeildNormal() {
    return Container(
      width: screenW * 0.7,
      margin: EdgeInsets.only(top: screenH * 0.04),
      child: TextFormField(
        autofocus: true,
        obscureText: false,
        onChanged: (value) => email = value,
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.mail_outline_outlined),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          filled: true,
          fillColor: Color(0xFFDFDEDE),
        ),
      ),
    );
  }
}
