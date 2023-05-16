// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:everygym/states/informationForm.dart';

class informationFormModel {
  final String sex;
  final String weigth;
  final String height;
  final String exp;
  final DateTime year;
  final String bmi;
  final double indexUser;
  final int age;
  final String textBMI;
  informationFormModel({
    required this.sex,
    required this.weigth,
    required this.height,
    required this.exp,
    required this.year,
    required this.bmi,
    required this.indexUser,
    required this.age,
    required this.textBMI,
  });

  informationFormModel copyWith({
    String? sex,
    String? weigth,
    String? height,
    String? exp,
    DateTime? year,
    String? bmi,
    double? indexUser,
    int? age,
    String? textBMI,
  }) {
    return informationFormModel(
      sex: sex ?? this.sex,
      weigth: weigth ?? this.weigth,
      height: height ?? this.height,
      exp: exp ?? this.exp,
      year: year ?? this.year,
      bmi: bmi ?? this.bmi,
      indexUser: indexUser ?? this.indexUser,
      age: age ?? this.age,
      textBMI: textBMI ?? this.textBMI,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sex': sex,
      'weigth': weigth,
      'height': height,
      'exp': exp,
      'year': year.millisecondsSinceEpoch,
      'bmi': bmi,
      'indexUser': indexUser,
      'age': age,
      'textBMI': textBMI,
    };
  }

  factory informationFormModel.fromMap(Map<String, dynamic> map) {
    return informationFormModel(
      sex: map['sex'] as String,
      weigth: map['weigth'] as String,
      height: map['height'] as String,
      exp: map['exp'] as String,
      year: DateTime.fromMillisecondsSinceEpoch(map['year'] as int),
      bmi: map['bmi'] as String,
      indexUser: map['indexUser'] as double,
      age: map['age'] as int,
      textBMI: map['textBMI'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory informationFormModel.fromJson(String source) => informationFormModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'informationFormModel(sex: $sex, weigth: $weigth, height: $height, exp: $exp, year: $year, bmi: $bmi, indexUser: $indexUser, age: $age, textBMI: $textBMI)';
  }

  @override
  bool operator ==(covariant informationFormModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.sex == sex &&
      other.weigth == weigth &&
      other.height == height &&
      other.exp == exp &&
      other.year == year &&
      other.bmi == bmi &&
      other.indexUser == indexUser &&
      other.age == age &&
      other.textBMI == textBMI;
  }

  @override
  int get hashCode {
    return sex.hashCode ^
      weigth.hashCode ^
      height.hashCode ^
      exp.hashCode ^
      year.hashCode ^
      bmi.hashCode ^
      indexUser.hashCode ^
      age.hashCode ^
      textBMI.hashCode;
  }
}
