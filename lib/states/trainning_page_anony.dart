import 'package:flutter/material.dart';

class Anonymous extends StatefulWidget {
  const Anonymous({Key? key}) : super(key: key);

  @override
  State<Anonymous> createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('data'),);
  }
}