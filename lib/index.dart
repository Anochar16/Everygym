import 'package:everygym/states/authen.dart';
import 'package:everygym/states/createAccount.dart';
import 'package:everygym/states/edit_profile.dart';
import 'package:everygym/states/home.dart';
import 'package:everygym/states/informationForm.dart';
import 'package:everygym/states/page_navigator_navbar/trainning_page.dart';
import 'package:everygym/states/pose_Estimat/excercise.dart';
import 'package:everygym/states/trainning_page_anony.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/informationForm': (BuildContext context) => InformationForm(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/trainning': (BuildContext context) => Trainning(),
  '/anonymous': (BuildContext context) => Anonymous(),
  '/editprofile': (BuildContext context) => EditProfile(),
  '/home': (BuildContext context) => Home(),
  '/excercise':(BuildContext context) => ExCercise(),
  
};
