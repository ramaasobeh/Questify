import 'package:flutter/material.dart';
import 'package:project1/screens/home/Provider/favourite_provider.dart';
import 'package:project1/screens/home/Provider/select_provider.dart';
import 'package:project1/screens/home/home_view_profesor.dart';
import 'package:project1/screens/home/home_view_student.dart';
import 'package:project1/screens/home/profesor/autamitic.dart';
import 'package:project1/screens/home/profesor/bank.dart';
import 'package:project1/screens/home/selected_questions/select_questions.dart';
import 'package:project1/screens/home/selected_questions/selected_questions.dart';
import 'package:project1/screens/home/student/Summary_Screen.dart';
import 'package:project1/screens/login/login_screen.dart';
import 'package:project1/screens/login/splashPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_) => FavItem()),
      ChangeNotifierProvider(create: (_) => SelectIem()),
    ],
      child: Builder(
        builder: (BuildContext context) {


        return MaterialApp(
          debugShowCheckedModeBanner: false,
      title: 'QUESTIFY',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:SplashPage(),
    );}));
  }
}


