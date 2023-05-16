import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../res/get_ex_warmup.dart';

class Trainning extends StatefulWidget {
  const Trainning({Key? key}) : super(key: key);

  @override
  State<Trainning> createState() => _TrainningState();
}

class _TrainningState extends State<Trainning> {
  double? screenH, screenW;
  List<String> entries = ['a', 'b', 'c'];
  @override
  void initState() {
    getWarmupByCollection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int switcherIndex1 = 0;
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Training')),
      drawer: Drawer(child: Mydrawer()),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          myStyle().myBackground(screenW: screenW!, screenH: screenH!),
          Column(children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: screenH! * 0.02),
                color: Color.fromARGB(34, 255, 255, 255),
                height: screenH,
                width: screenW! * 0.9,
                child: ContainedTabBarView(
                  tabs: [
                    Text('Warm Up'),
                    Text('Aerobic'),
                    Text('Cooldown'),
                  ],
                  views: [
                    Container(
                      child: ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(top: 8.0),
                              height: 50,
                              color: Colors.amber,
                              child: Row(
                                children: [
                                  Text('Entry ${entries[index]}'),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(color: Colors.green),
                    Container(color: Color.fromARGB(255, 201, 209, 202))
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            )
          ])
        ],
      )),
    );
  }
}
