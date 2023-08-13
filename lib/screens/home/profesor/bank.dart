import 'package:flutter/material.dart';
import 'package:project1/screens/widget/centered_view/new.dart';

import '../../widget/navigation_bar.dart';
import '../selected_questions/select_questions.dart';
import 'autamitic.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Navigation(),
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
            width: 1200,
            height: 1200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 600,
                        height: 600,
                        child: SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           Text("Questions")
                          ],),
                        ),
                      ),


                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                  child: Column(

                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: (){
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (BuildContext context) => Autamtic()),
                                                  (Route<dynamic>route) => false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.purple.shade900,
                                          fixedSize: const Size(300, 55),
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text("Generate template"),
                                      ),

                                      SizedBox(height: 20,),
                                      ElevatedButton(
                                        onPressed: (){
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (BuildContext context) => SelectQuestion()),
                                                  (Route<dynamic>route) => false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.purple.shade900,
                                          fixedSize: const Size(300, 55),
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text("Choose your questions"),
                                      ),


                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      )

                    ],))
                ],), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
