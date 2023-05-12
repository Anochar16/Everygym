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
  informationFormModel({
    required this.sex,
    required this.weigth,
    required this.height,
    required this.exp,
    required this.year,
  });

  informationFormModel copyWith({
    String? sex,
    String? weigth,
    String? height,
    String? exp,
    DateTime? year,
  }) {
    return informationFormModel(
      sex: sex ?? this.sex,
      weigth: weigth ?? this.weigth,
      height: height ?? this.height,
      exp: exp ?? this.exp,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (sex != null) 'sex': sex,
      if (weigth != null) 'weigth': weigth,
      if (height != null) 'height': height,
      if (exp != null) 'exp': exp,
      if (year != null) 'year': year.millisecondsSinceEpoch,
    };
  }

  factory informationFormModel.fromMap(Map<String, dynamic> map) {
    return informationFormModel(
      sex: map['sex'] as String,
      weigth: map['weigth'] as String,
      height: map['height'] as String,
      exp: map['exp'] as String,
      year: DateTime.fromMillisecondsSinceEpoch(map['year'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory informationFormModel.fromJson(String source) =>
      informationFormModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'informationFormModel(sex: $sex, weigth: $weigth, height: $height, exp: $exp, year: $year)';
  }

  @override
  bool operator ==(covariant informationFormModel other) {
    if (identical(this, other)) return true;

    return other.sex == sex &&
        other.weigth == weigth &&
        other.height == height &&
        other.exp == exp &&
        other.year == year;
  }

  @override
  int get hashCode {
    return sex.hashCode ^
        weigth.hashCode ^
        height.hashCode ^
        exp.hashCode ^
        year.hashCode;
  }

  factory informationFormModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return informationFormModel(
        exp: data?['exp'], height: data?['height'], sex: data?['sex'], weigth: data?['weigth'], year: data?['year']);
  }

  Map<String, dynamic> toFirestore() {
    return {};
  }
}
