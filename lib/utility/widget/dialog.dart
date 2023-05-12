import 'package:everygym/utility/style/my_style.dart';
import 'package:flutter/material.dart';

class dialog {
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok'))
        ],
      ),
    );
  }
  
}
