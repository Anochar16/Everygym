
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowAccount extends StatefulWidget {
  const ShowAccount({Key? key}) : super(key: key);

  @override
  State<ShowAccount> createState() => _ShowAccountState();
}

class _ShowAccountState extends State<ShowAccount> {
String? email = FirebaseAuth.instance.currentUser!.email;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.perm_identity_outlined),
      title: Text('$email'),
    );
  }
}
