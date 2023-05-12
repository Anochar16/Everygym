
import 'package:everygym/utility/widget/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Trainning extends StatefulWidget {
  const Trainning({Key? key}) : super(key: key);

  @override
  State<Trainning> createState() => _TrainningState();
}

class _TrainningState extends State<Trainning> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Training')),
        drawer: Drawer(child:Mydrawer()));
  }
}
