// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class History {
  final double score;
  final int time;
  final DateTime date;
  History({
    required this.score,
    required this.time,
    required this.date,
  });

  History copyWith({
    double? score,
    int? time,
    DateTime? date,
  }) {
    return History(
      score: score ?? this.score,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (score != null) 'score': score,
      if (time != null) 'time': time,
      if (date != null) 'date': date.millisecondsSinceEpoch,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      score: map['score'] as double,
      time: map['type_index'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(score: $score, time: $time, date: $date)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.score == score && other.time == time && other.date == date;
  }

  @override
  int get hashCode => score.hashCode ^ time.hashCode ^ date.hashCode;
}
