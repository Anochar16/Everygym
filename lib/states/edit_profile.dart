import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:everygym/index.dart';
import 'package:everygym/modals/information_form.dart';
import 'package:everygym/states/informationForm.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:everygym/utility/widget/dialog.dart';
import 'package:everygym/utility/widget/textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ex_manege/manage_index.dart';
import '../utility/widget/my_drawer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? Username = FirebaseAuth.instance.currentUser!.displayName;
  User? user = FirebaseAuth.instance.currentUser;

  String? sex, width, height, exp, textBMI;
  int? year;
  double? screenW, screenH, bmi, indexUser;
  DateTime? yearOfBirth;
  DateTime? selectyear;
  int? yearTo, age;
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final List<String> _exp = [
    'more than 3 times a week',
    'less than 3 times a week',
    'never exercise'
  ];
  final List<String> _gender = ["male", "Female"];
  String showYear = "Year of brith";

  selectYear(context, year) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Year'),
            content: SizedBox(
              height: screenH! * 0.4,
              width: screenW,
              child: YearPicker(
                  firstDate: DateTime(DateTime.now().year - 100, 1),
                  lastDate: DateTime.now(),
                  selectedDate: yearOfBirth!,
                  onChanged: (value) {
                    setState(() {
                      selectyear = value;
                      yearOfBirth = value;
                      showYear = "${value.year}";
                      print('$year');
                    });
                    Navigator.pop(context);
                  }),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<dynamic> getUserData() async {
    await FirebaseFirestore.instance
        .collection('customer')
        .doc(user!.uid)
        .collection("information")
        .doc(user!.email)
        .snapshots()
        .listen((event) {
      setState(() {
        _widthController.text = event.get('weigth');
        sex = event.get('sex');
        exp = event.get('exp');
        _heightController.text = event.get('height');
        year = event.get('year');
        yearOfBirth = DateTime.fromMillisecondsSinceEpoch(year!);
        showYear = yearOfBirth!.year.toString();
        selectyear = yearOfBirth;
        print(selectyear);
      });
    });
  }

  Future<void> _updateUser(
      sex, width, height, exp, DateTime _year, detailBMI) async {
    if (sex != null) {
      sex = sex;
      width = width;
      height = height;
      exp = exp;
      selectyear = _year;
      print('  -->year is  ' + year.toString());
    } else {
      // print(' sex: $sex  ------>width is $_widthController ');
      print('null value');
    }
    informationFormModel model = informationFormModel(
        sex: sex!,
        weigth: _widthController.text,
        height: _heightController.text,
        exp: exp!,
        year: selectyear!,
        bmi: bmi!.toStringAsFixed(2),
        indexUser: indexUser!,
        age: age!,
        textBMI: textBMI!);
    Map<String, dynamic> data = model.toMap();
    await FirebaseFirestore.instance
        .collection('customer')
        .doc(user!.uid)
        .collection('information')
        .doc(user!.email)
        .update(data)
        .then((value) {
      print('update');
      print(' -->year is $year ');
    }).catchError((onError) =>
            dialog().normalDialog(context, onError.code, onError.message));
    dialog().myDialog(context, '$textBMI', '$detailBMI');
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Edit profile')),
      body: Stack(children: [
        myStyle().myBackground(screenW: screenW!, screenH: screenH!),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      bottom: screenH! * 0.05, top: screenH! * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: screenW! * 0.02),
                        child: Icon(
                          Icons.perm_identity_outlined,
                          color: Colors.white,
                          size: screenW! * 0.07,
                        ),
                      ),
                      Text(
                        '$Username',
                        style: textStyle()
                            .textheightlight(fontSize: screenW! * 0.07),
                      ),
                    ],
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
                  Container(
                    padding: EdgeInsets.only(
                        left: screenW! * 0.1, top: screenH! * 0.02),
                    child: Column(
                      children: [
                        genderRadio(screenW!),
                        heightFieldRow(screenW!),
                        widthFieldRow(screenW!),
                        expRadio(screenW!),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: screenW! * 0.08),
                            child: ElevatedButton(
                              onPressed: () {
                                selectYear(context, year);
                                print('Button click $year');
                                print('showyear is $showYear');
                                print('yearOfBirth is ' +
                                    yearOfBirth!.year.toString());
                              },
                              child: Container(
                                  width: screenW! * 0.5, child: Text(showYear)),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            if ((sex?.isEmpty ?? true) ||
                                (exp?.isEmpty ?? true) ||
                                (selectyear == null) ||
                                (_widthController.text == null) ||
                                (_heightController.text == null)) {
                              dialog().normalDialog(context, 'Have space',
                                  'Please fill every black');
                            } else {
                              List getCalculate = calculateIndex();
                              bmi = getCalculate[0];
                              textBMI = getCalculate[1];
                              age = getCalculate[2];
                              indexUser = getCalculate[3];
                              var detailBMI = getCalculate[4];

                              _updateUser(
                                  sex,
                                  _widthController.text,
                                  _heightController.text,
                                  exp,
                                  yearOfBirth!,
                                  detailBMI);
                            }
                          },
                          child: Text('Save'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  List calculateIndex() {
    DateTime.now().year;
    var expIndex, sexIndex, ageIndex, bmiIndex, userIndex;
    String height = _heightController.text;
    String weigth = _widthController.text;
    double h = double.parse(height);
    double w = double.parse(weigth);
    double bmi;
    List BMIList;
    int age = DateTime.now().year - yearOfBirth!.year;
    expIndex = setIndexExercise(exp);
    sexIndex = setIndexGender(sex);
    ageIndex = setIndexAge(age);
    bmi = setBMIIndex(h, w);
    BMIList = setValueBMI(bmi);
    bmiIndex = BMIList[0];
    textBMI = BMIList[1];
    var detailBMI = BMIList[2];
    userIndex = expIndex + sexIndex + ageIndex + bmiIndex;

    return [bmi, textBMI, age, userIndex, detailBMI];
  }

  Container buttonYear(double screenW, Future<Null> selectYear(dynamic context),
      BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left: screenW * 0.08),
        child: ElevatedButton(
          onPressed: () {
            selectYear(context);
            print('click buttonYear year is $year');
            print(showYear);
          },
          child: Container(width: screenW * 0.5, child: Text(showYear)),
        ));
  }

  Row heightFieldRow(double screenW) {
    return Row(
      children: [
        Text(
          'height',
          style:
              TextStyle(fontSize: screenW * 0.04, fontWeight: FontWeight.bold),
        ),
        myFeild().textfeildOutline(
            hint: _heightController.text,
            width: screenW,
            controll: _heightController)
      ],
    );
  }

  Row widthFieldRow(double screenW) {
    return Row(
      children: [
        Text(
          'width',
          style:
              TextStyle(fontSize: screenW * 0.04, fontWeight: FontWeight.bold),
        ),
        myFeild().textfeildOutline(
            hint: _widthController.text,
            width: screenW,
            controll: _widthController)
      ],
    );
  }

  Column expRadio(double screenW) {
    return Column(
      children: [
        for (int i = 0; i < _exp.length; i++)
          Container(
            margin: EdgeInsets.only(left: screenW * 0.05),
            child: Row(
              children: [
                Radio(
                    value: _exp[i].toString(),
                    groupValue: exp,
                    onChanged: (value) {
                      setState(() {
                        exp = value.toString();
                      });
                    }),
                Text(_exp[i])
              ],
            ),
          )
      ],
    );
  }

  Column genderRadio(double screenW) {
    return Column(
      children: [
        for (int i = 0; i < _gender.length; i++)
          Container(
            margin: EdgeInsets.only(left: screenW * 0.05),
            child: Row(
              children: [
                Radio(
                    value: _gender[i].toString(),
                    groupValue: sex,
                    onChanged: (value) {
                      setState(() {
                        sex = value.toString();
                      });
                    }),
                Text(_gender[i])
              ],
            ),
          )
      ],
    );
  }
}
