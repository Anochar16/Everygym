import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/modals/dataExcercise.dart';
import 'package:everygym/modals/information_form.dart';
import 'package:everygym/utility/widget/dialog.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ex_manege/manage_index.dart';

class InformationForm extends StatefulWidget {
  const InformationForm({Key? key}) : super(key: key);

  @override
  State<InformationForm> createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  late double screenW, screenH;
  final List<String> _gender = ["male", "Female"];
  final List<String> _exp = [
    'more than 3 times a week',
    'less than 3 times a week',
    'never exercise'
  ];
  String showYear = "Year of brith";
  DateTime _selectedYear = DateTime.now();
  String? _setexp, _sex, textBMI;
  int? age;
  var weigth, height;
  var detail;
  double? bmi, indexUser;
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weigthController = TextEditingController();
  User user = FirebaseAuth.instance.currentUser!;
  Future<Null> setFirstInformation() async {
    await Firebase.initializeApp().then((value) async {
      informationFormModel model = informationFormModel(
          indexUser: indexUser!,
          sex: _sex!,
          weigth: _weigthController.text,
          height: _heightController.text,
          exp: _setexp!,
          year: _selectedYear,
          bmi: bmi!.toStringAsFixed(2),
          age: age!,
          textBMI: textBMI!);

      Map<String, dynamic> data = model.toMap();
      await FirebaseFirestore.instance
          .collection('customer')
          .doc(user.uid)
          .collection('information')
          .doc(user.email)
          .set(data)
          .catchError((onError) =>
              dialog().normalDialog(context, onError.code, onError.message));
      if (detail == null) {
        Navigator.pushNamed(context, '/home');
      } else {
        dialog().myDialog(context, '$textBMI', '$detail');
      }
    });
    SumDataExeciseModel modelExer =
        SumDataExeciseModel(sumTime: 0.0, average_score: 0.0, workout: 0);
    Navigator.pushNamed(context, '/home');
  }

  Future<Null> setSkip() async {
    informationFormModel model = informationFormModel(
        indexUser: 0,
        sex: '',
        weigth: '',
        height: '',
        exp: '',
        year: _selectedYear,
        bmi: '',
        age: 0,
        textBMI: '');

    Map<String, dynamic> data = model.toMap();
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('customer')
          .doc(user.uid)
          .collection('information')
          .doc(user.email)
          .set(data)
          .catchError((onError) =>
              dialog().normalDialog(context, onError.code, onError.message));
    });
    Navigator.pushNamed(context, '/home');
  }

  Future<Null> setExercise() async {
    SumDataExeciseModel modelExer =
        SumDataExeciseModel(sumTime: 0.0, average_score: 0.0, workout: 0);
    Map<String, dynamic> exercise = modelExer.toMap();
    await FirebaseFirestore.instance
        .collection('customer')
        .doc(user.uid)
        .collection('exercise')
        .doc(user.email)
        .set(exercise);
  }

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Year'),
            content: SizedBox(
              height: screenH * 0.4,
              width: screenW,
              child: YearPicker(
                  firstDate: DateTime(DateTime.now().year - 100, 1),
                  lastDate: DateTime.now(),
                  selectedDate: _selectedYear,
                  onChanged: (value) {
                    setState(() {
                      _selectedYear = value;
                      showYear = "${value.year}";
                    });
                    Navigator.pop(context);
                  }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        myStyle().myBackground(screenW: screenW, screenH: screenH),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      bottom: screenH * 0.05, top: screenH * 0.1),
                  child: Text(
                    'Let us know you better',
                    style:
                        textStyle().textheightlight(fontSize: screenW * 0.07),
                  )),
              Stack(
                children: [
                  Container(
                      width: screenW,
                      height: screenH,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                          ))),
                  Column(children: [
                    textContent(
                        content: 'What are you gender',
                        margin: EdgeInsets.only(
                            top: screenH * 0.05, left: screenW * 0.05)),
                    genderRadio(),
                    textContent(
                        content: 'When is your birthday',
                        margin: EdgeInsets.only(
                            top: screenH * 0.02, left: screenW * 0.05)),
                    selectYeatButton(context),
                    Row(
                      children: [
                        textContent(
                            content: 'height',
                            margin: EdgeInsets.only(
                                top: screenH * 0.02, left: screenW * 0.05)),
                        myFeild().textfeildOutline(
                            hint: 'height',
                            width: screenW,
                            controll: _heightController)
                      ],
                    ),
                    Row(
                      children: [
                        textContent(
                            content: 'weigth',
                            margin: EdgeInsets.only(
                                top: screenH * 0.02, left: screenW * 0.05)),
                        myFeild().textfeildOutline(
                            hint: 'weigth',
                            width: screenW,
                            controll: _weigthController)
                      ],
                    ),
                    textContent(
                        content: 'How much exercise experience do you have?',
                        margin: EdgeInsets.only(
                            top: screenH * 0.02, left: screenW * 0.05)),
                    expRadio(),
                    buttonSkipAndSave()
                  ])
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Container buttonSkipAndSave() {
    return Container(
      margin: EdgeInsets.only(right: screenW * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(right: screenW * 0.03),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedYear = DateTime.now();
                    });
                    setExercise();
                    setSkip();
                    // Navigator.pushNamed(context, '/home');
                  },
                  child: Text("Skip"))),
          Container(
              child: ElevatedButton(
                  onPressed: () {
                    if ((_sex?.isEmpty ?? true) ||
                        (_setexp?.isEmpty ?? true) ||
                        (_selectedYear == null) ||
                        (_weigthController.text == null) ||
                        (_heightController.text == null)) {
                      dialog().normalDialog(
                          context, 'Have space', 'Please fill every black');
                      print(
                          " exp is $_setexp ----- sex is $_sex ----- yesr is $_selectedYear ----- weigth is $_weigthController.text ----- height is $_heightController.text");
                    } else {
                      List getCalculate = calculateIndex();
                      bmi = getCalculate[0];
                      textBMI = getCalculate[1];
                      age = getCalculate[2];
                      indexUser = getCalculate[3];
                      detail = getCalculate[4];
                      setExercise();
                      setFirstInformation();
                      print(
                          " exp is $_setexp ----- sex is $_sex ----- yesr is $_selectedYear ----- weigth is$_weigthController.text ----- height is $_heightController.text");
                    }
                  },
                  child: Text("Save"))),
        ],
      ),
    );
  }

  List calculateIndex() {
    var expIndex, sexIndex, ageIndex, bmiIndex, userIndex;
    String height = _heightController.text;
    String weigth = _weigthController.text;
    double h = double.parse(height);
    double w = double.parse(weigth);
    double bmi;
    List BMIList;
    int age = DateTime.now().year - _selectedYear.year;
    expIndex = setIndexExercise(_setexp);
    sexIndex = setIndexGender(_sex);
    ageIndex = setIndexAge(age);
    bmi = setBMIIndex(h, w);
    BMIList = setValueBMI(bmi);
    bmiIndex = BMIList[0];
    textBMI = BMIList[1];
    var detailBMI = BMIList[2];
    userIndex = expIndex + sexIndex + ageIndex + bmiIndex;

    return [bmi, textBMI, age, userIndex, detailBMI];
  }

  Container selectYeatButton(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: screenW * 0.08),
      child: ElevatedButton(
          onPressed: () {
            selectYear(context);
          },
          child: Container(width: screenW * 0.5, child: Text(showYear))),
    );
  }

  Container textContent({required String content, required margin}) {
    return Container(
        margin: margin,
        alignment: Alignment.topLeft,
        child: Text(content,
            style: TextStyle(color: Colors.black, fontSize: screenW * 0.04)));
  }

  Column genderRadio() {
    return Column(
      children: [
        for (int i = 0; i < _gender.length; i++)
          Container(
            margin: EdgeInsets.only(left: screenW * 0.05),
            child: Row(
              children: [
                Radio(
                    value: _gender[i].toString(),
                    groupValue: _sex,
                    onChanged: (value) {
                      setState(() {
                        _sex = value.toString();
                      });
                    }),
                Text(_gender[i])
              ],
            ),
          )
      ],
    );
  }

  Column expRadio() {
    return Column(
      children: [
        for (int i = 0; i < _exp.length; i++)
          Container(
            margin: EdgeInsets.only(left: screenW * 0.05),
            child: Row(
              children: [
                Radio(
                    value: _exp[i].toString(),
                    groupValue: _setexp,
                    onChanged: (value) {
                      setState(() {
                        _setexp = value.toString();
                      });
                    }),
                Text(_exp[i])
              ],
            ),
          )
      ],
    );
  }
}
