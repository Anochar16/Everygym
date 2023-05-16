// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class SumDataExeciseModel {
  final double sumTime;
  final double average_score;
  final int workout;
  SumDataExeciseModel({
    required this.sumTime,
    required this.average_score,
    required this.workout,
  });

  SumDataExeciseModel copyWith({
    double? sumTime,
    double? average_score,
    int? workout,
  }) {
    return SumDataExeciseModel(
      sumTime: sumTime ?? this.sumTime,
      average_score: average_score ?? this.average_score,
      workout: workout ?? this.workout,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sumTime': sumTime,
      'average_score': average_score,
      'workout': workout,
    };
  }

  factory SumDataExeciseModel.fromMap(Map<String, dynamic> map) {
    return SumDataExeciseModel(
      sumTime: map['sumTime'] as double,
      average_score: map['average_score'] as double,
      workout: map['workout'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SumDataExeciseModel.fromJson(String source) =>
      SumDataExeciseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SumDataExeciseModel(sumTime: $sumTime, average_score: $average_score, workout: $workout)';

  @override
  bool operator ==(covariant SumDataExeciseModel other) {
    if (identical(this, other)) return true;

    return other.sumTime == sumTime &&
        other.average_score == average_score &&
        other.workout == workout;
  }

  @override
  int get hashCode =>
      sumTime.hashCode ^ average_score.hashCode ^ workout.hashCode;
}

class Cooldown {
  final List cooldown_name;
  final List cooldown_score;
  Cooldown({
    required this.cooldown_name,
    required this.cooldown_score,
  });

  Cooldown copyWith({
    List? cooldown_name,
    List? cooldown_score,
  }) {
    return Cooldown(
      cooldown_name: cooldown_name ?? this.cooldown_name,
      cooldown_score: cooldown_score ?? this.cooldown_score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cooldown_name': cooldown_name,
      'cooldown_score': cooldown_score,
    };
  }

  factory Cooldown.fromMap(Map<String, dynamic> map) {
    return Cooldown(
        cooldown_name: List.from(
          (map['cooldown_name'] as List),
        ),
        cooldown_score: List.from(
          (map['cooldown_score'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Cooldown.fromJson(String source) =>
      Cooldown.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'cooldown(cooldown_name: $cooldown_name, cooldown_score: $cooldown_score)';

  @override
  bool operator ==(covariant Cooldown other) {
    if (identical(this, other)) return true;

    return listEquals(other.cooldown_name, cooldown_name) &&
        listEquals(other.cooldown_score, cooldown_score);
  }

  @override
  int get hashCode => cooldown_name.hashCode ^ cooldown_score.hashCode;
}

class Aerobic {
  final List aerobic_name;
  final List aerobic_score;
  Aerobic({
    required this.aerobic_name,
    required this.aerobic_score,
  });

  Aerobic copyWith({
    List? aerobic_name,
    List? aerobic_score,
  }) {
    return Aerobic(
      aerobic_name: aerobic_name ?? this.aerobic_name,
      aerobic_score: aerobic_score ?? this.aerobic_score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aerobic_name': aerobic_name,
      'aerobic_score': aerobic_score,
    };
  }

  factory Aerobic.fromMap(Map<String, dynamic> map) {
    return Aerobic(
        aerobic_name: List.from(
          (map['aerobic_name'] as List),
        ),
        aerobic_score: List.from(
          (map['aerobic_score'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Aerobic.fromJson(String source) =>
      Aerobic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Aerobic(aerobic_name: $aerobic_name, aerobic_score: $aerobic_score)';

  @override
  bool operator ==(covariant Aerobic other) {
    if (identical(this, other)) return true;

    return listEquals(other.aerobic_name, aerobic_name) &&
        listEquals(other.aerobic_score, aerobic_score);
  }

  @override
  int get hashCode => aerobic_name.hashCode ^ aerobic_score.hashCode;
}

class WarmUp {
  final List warmup_name;
  final List warmup_score;
  WarmUp({
    required this.warmup_name,
    required this.warmup_score,
  });

  WarmUp copyWith({
    List? warmup_name,
    List? warmup_score,
  }) {
    return WarmUp(
      warmup_name: warmup_name ?? this.warmup_name,
      warmup_score: warmup_score ?? this.warmup_score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'warmup_name': warmup_name,
      'warmup_score': warmup_score,
    };
  }

  factory WarmUp.fromMap(Map<String, dynamic> map) {
    return WarmUp(
      warmup_name: List.from((map['warmup_name'] as List),),
      warmup_score: List.from((map['warmup_score'] as List),)
    );
  }

  String toJson() => json.encode(toMap());

  factory WarmUp.fromJson(String source) => WarmUp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WarmUp(warmup_name: $warmup_name, warmup_score: $warmup_score)';

  @override
  bool operator ==(covariant WarmUp other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.warmup_name, warmup_name) &&
      listEquals(other.warmup_score, warmup_score);
  }

  @override
  int get hashCode => warmup_name.hashCode ^ warmup_score.hashCode;
}
