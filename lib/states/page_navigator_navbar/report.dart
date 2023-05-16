import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/modals/dataExcercise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utility/style/my_style.dart';
import '../../utility/widget/my_drawer.dart';
import '../calender.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  double? screenW, screenH;
//--------------> get for firebase <------------
  double? time = 0.0, score = 0.0;
  int? workout = 0;

  User? user = FirebaseAuth.instance.currentUser!;
  String? height = '', weigth = '', text_bmi = '',bmi='';
  String? date;
  @override
  void initState() {
    super.initState();
    getHistory();
    getInformationFeild();
  }

  Future getHistory() async {
    final sumExercise = await FirebaseFirestore.instance
        .collection("customer")
        .doc(user!.uid)
        .collection("exercise")
        .doc(user!.email)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                SumDataExeciseModel.fromMap(snapshot.data()!),
            toFirestore: (SumDataExeciseModel data, _) => data.toMap())
        .get();
    setState(() {
      time = sumExercise.data()?.sumTime ?? 0;
      score = sumExercise.data()?.average_score ?? 0;
      workout = sumExercise.data()?.workout ?? 0;
    });
  }

  Future<void> getInformationFeild() async {
    await FirebaseFirestore.instance
        .collection("customer")
        .doc(user!.uid)
        .collection("information")
        .doc(user!.email)
        .snapshots()
        .listen((event) {
      setState(() {
        weigth = event.get('weigth') ?? '0';
        height = event.get('height') ?? '0';
        bmi = event.get('bmi') ?? '';
        text_bmi = event.get('textBMI') ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: Text('Report')),
        drawer: Drawer(child: Mydrawer()),
        body: Stack(children: [
          myStyle().myBackground(screenW: screenW!, screenH: screenH!),
          SingleChildScrollView(
              child: Column(children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.only(top: screenH! * 0.02),
                width: screenW! * 0.9,
                height: screenH! * 0.15,
                child: Row(children: [
                  Container(
                    width: screenW! * 0.27,
                    child: TopContent(
                        message: '$time', title: 'DURATION', screenH: screenH),
                  ),
                  SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                  Container(
                    width: screenW! * 0.27,
                    child: TopContent(
                        message: '$workout',
                        title: 'WORKOUT',
                        screenH: screenH),
                  ),
                  SizedBox(
                    height: 100,
                    child: VerticalDivider(
                      thickness: 1,
                    ),
                  ),
                  Container(
                    width: screenW! * 0.26,
                    child: TopContent(
                        message: '$score', title: 'SCORE', screenH: screenH),
                  )
                ]),
              ),
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.only(top: screenH! * 0.02),
              width: screenW! * 0.9,
              height: screenH! * 0.15,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: screenW! * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('BMI'),
                          ),
                          Container(
                            child: Text(
                              '$bmi',
                              style: TextStyle(
                                  fontSize: screenW! * 0.1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('Body:  $text_bmi'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: VerticalDivider(
                        thickness: 1,
                      ),
                    ),
                    Container(
                      width: screenW! * 0.4,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('Height : $height'),
                            ),
                            divider(),
                            Container(
                              child: Text('Weight : $weigth'),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            )),
            Container(
              width: screenW! * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.only(top: screenH! * 0.02),
              child: MyCalendar(),
            )
          ]))
        ]));
  }

  Column TopContent({required message, required title, required screenH}) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: Text(
          message,
          style: TextStyle(fontSize: screenH! * 0.04),
        ),
      ),
      Container(
        child: Text(title, style: TextStyle(fontSize: screenH! * 0.02)),
      )
    ]);
  }
}
