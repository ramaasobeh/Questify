import 'package:flutter/material.dart';
import 'package:project1/screens/home/profesor/createBank.dart';
import 'package:project1/screens/home/student/Summary.dart';
import 'package:project1/screens/home/student/self_test.dart';
import 'package:project1/screens/home/student/study.dart';
import 'package:project1/screens/widget/centered_view/new.dart';

import '../widget/centered_view/centered_view.dart';
import '../widget/navigation2.dart';
import '../widget/navigation_bar.dart';

class HomeViewStudent extends StatelessWidget {
  const HomeViewStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer: Navigation2(),
      appBar: AppBar(
        elevation: 20,

        title: Text("Questify"), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white10,fontSize: 30),
        backgroundColor: Colors.purple.shade900,
        toolbarHeight: 60, // default is 56
        toolbarOpacity: 0.5,// simple as that!
      ),
      body: newCenter(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          elevation: 200,
          shadowColor: Colors.black,
          color: Colors.white,
          child: SizedBox(
            width: 1000,
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

                children: <Widget>[
                  Expanded(child: Row(

                    children: <Widget>[
                      SizedBox(
                        width: 500,
                        height: 1000,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => Summary()),
                                        (Route<dynamic>route) => false);

                              },

                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),

                                primary: Colors.purple.shade900,
                                fixedSize: const Size(300, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text("Summary"),

                            ),
                            SizedBox(height: 15,),

                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => SelfTest()),
                                        (Route<dynamic>route) => false);
                              },

                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),

                                primary: Colors.purple.shade900,
                                fixedSize: const Size(300, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text("Self test"),

                            ),
                            SizedBox(height: 15,),

                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Welcome to our website\nlet's study with each other",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w700
                                ),),
                            ],

                          ),

                      ),
                    ],))
                ],), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
