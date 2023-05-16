
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/states/page_navigator_navbar/report.dart';
import 'package:everygym/states/page_navigator_navbar/trainning_page.dart';
import 'package:flutter/material.dart';

class Anonymous extends StatefulWidget {
  const Anonymous({Key? key}) : super(key: key);

  @override
  State<Anonymous> createState() => _Anonymous();
}

class _Anonymous extends State<Anonymous> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Training'),),
        body: Container()
       
    );
  }
}
