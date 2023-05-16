import 'dart:collection';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/states/page_navigator_navbar/report.dart';
import 'package:everygym/utility/style/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';

import '../modals/history.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

CalendarFormat _calendarFormat = CalendarFormat.month;

class _MyCalendarState extends State<MyCalendar> {
  late double screenW, screenH;
  User user = FirebaseAuth.instance.currentUser!;
  DateTime today = DateTime.now();
  
  late Map<DateTime, List<History>> _events;
  @override
  void initState() {
    super.initState();
    _events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    _loadFirestoreEvents();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void _onDaySelected(DateTime day, DateTime events) {
    setState(() {
      today = day;
    });
  }

  _loadFirestoreEvents() async {
    final snap = await FirebaseFirestore.instance
        .collection('customer')
        .doc(user.uid)
        .collection("exercise")
        .doc(user.email)
        .collection("history")
        .withConverter(
            fromFirestore: (snapshot, options) =>
                History.fromMap(snapshot.data()!),
            toFirestore: (History event, _) => event.toMap())
        .get();
    for (var doc in snap.docs) {
      final event = doc.data();
      // print('debug data from firestore $event');
      final day =
          DateTime.utc(event.date.year, event.date.month, event.date.day);
      if (_events[day] == null) {
        _events[day] = [];
      }
      _events[day]!.add(event);
      print(_events);
    }
    setState(() {});
  }

  List _getEventsForTheDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.of(context).size.width;
    screenH = MediaQuery.of(context).size.height;

    return calendar();
  }

  Widget calendar() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TableCalendar(
            eventLoader: _getEventsForTheDay,
            focusedDay: today,
            firstDay: DateTime(DateTime.now().year - 1),
            lastDay: DateTime.now(),
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mouth',
              CalendarFormat.week: 'Week'
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,
          ),
          ..._getEventsForTheDay(today).map((event) => Column(children: [
                divider(),
                showEventCalendar('Score', event.score.toString()),
                showEventCalendar('Time', event.time.toString()),
                divider()
              ]))
        ],
      ),
    );
  }

  Container showEventCalendar(title, detail) {
    return Container(
      margin: EdgeInsets.only(left: screenW * 0.05, bottom: screenH! * 0.01),
      child: Row(
        children: [
          Container(width: screenW * 0.15, child: Text(title)),
          Container(
            width: screenW * 0.4,
            child: Text(detail),
          )
        ],
      ),
    );
  }
}
