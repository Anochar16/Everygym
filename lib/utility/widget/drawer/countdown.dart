import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.timelapse_outlined),
      title: Text("Countdown time"),
      onTap: () {
        Navigator.pushNamed(context, '/excercise');
      },
    );
  }
}
