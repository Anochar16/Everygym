import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/modals/userAccount.dart';
import 'package:everygym/states/informationForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:everygym/utility/widget/dialog.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/textfeild.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

String? username, password, useremail;

class _CreateAccountState extends State<CreateAccount> {
  late double screenW, screenH;
  bool redEye = true;

  Future<Null> createAccount() async {
    await Firebase.initializeApp().then((value) async {
      print(
          '#######################initializeApp email ==> $useremail,password ==> $password');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: useremail!, password: password!)
          .then((value) async {
        await value.user
            ?.updateProfile(displayName: username)
            .then((value2) async {
          String uid = value.user!.uid;
          userAccountModel model =
              userAccountModel(email: useremail!, userName: username!);
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('customer')
              .doc(uid)
              .set(data)
              .then(
                  (value) => Navigator.pushNamed(context, '/informationForm'));
        });
        //  print('create account');
      }).catchError((onError) =>
             dialog().normalDialog(context, onError.code, onError.message));
    });
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            myStyle().myBackground(screenW: screenW, screenH: screenH),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SignUp',
                      style: textStyle()
                          .textheightlight(fontSize: screenW * 0.15)),
                  textFeildUsername(),
                  textFeildEmail(),
                  passwordFeild(),
                  Container(
                      margin: EdgeInsets.only(top: screenH * 0.05),
                      child: Container(
                          width: screenW * 0.7,
                          child: ElevatedButton(
                              onPressed: () {
                                if ((useremail?.isEmpty ?? true) ||
                                    (username?.isEmpty ?? true) ||
                                    (password?.isEmpty ?? true)) {
                                 dialog().normalDialog(context, 'Have space',
                                      'Please fill every black');
                                } else {
                                  createAccount();
                                }
                              },
                              child: Text('SignUp'))))
                ],
              ),
            )
          ],
        ));
  }

  Container passwordFeild() {
    return Container(
      width: screenW * 0.7,
      margin: EdgeInsets.only(top: screenH * 0.01),
      child: TextFormField(
        autofocus: true,
        obscureText: redEye,
        onChanged: (value) => password = value.trim(),
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

  Container textFeildUsername() {
    return Container(
      width: screenW * 0.7,
      margin: EdgeInsets.only(top: screenH * 0.08),
      child: TextFormField(
        autofocus: true,
        obscureText: false,
        onChanged: (value) => username = value.trim(),
        decoration: InputDecoration(
          hintText: 'Username',
          prefixIcon: Icon(Icons.perm_identity_outlined),
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

  Container textFeildEmail() {
    return Container(
      width: screenW * 0.7,
      margin: EdgeInsets.only(top: screenH * 0.01),
      child: TextFormField(
        autofocus: true,
        obscureText: false,
        onChanged: (value) => useremail = value.trim(),
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.mail_outlined),
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
