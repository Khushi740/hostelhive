import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_minor/screens/complaints.dart';
import 'package:final_minor/screens/navbar.dart';
import 'package:final_minor/screens/notice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );
  }
}
