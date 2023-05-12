import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app_outlined),
      title: Text('SignOut'),
      onTap: () async {
        await Firebase.initializeApp().then((value) async {
          await FirebaseAuth.instance.signOut().then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, '/authen', (route) => false));
        });
      },
    );
  }
}
