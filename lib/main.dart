import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'index.dart';

List<CameraDescription>? cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        initRoute = '/home';
        runApp(MyApp());
      } else {
        runApp(MyApp());
      }
    });
  });
}

String initRoute = '/authen';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: initRoute,
      // title: 'everygym', localizationsDelegates: [
      // GlobalMaterialLocalizations.delegate,
      // GlobalWidgetsLocalizations.delegate,
      // GlobalCupertinoLocalizations.delegate,]
    );
  }
}
