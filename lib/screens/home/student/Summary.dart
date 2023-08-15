import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home/student/Summary_Screen.dart';
import 'package:project1/screens/home/student/self_test.dart';
import 'package:project1/screens/home/student/study.dart';

import '../../widget/centered_view/new.dart';
import '../../widget/navigation2.dart';
import '../../widget/navigation_bar.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                              },

                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),

                                primary: Colors.black87,
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

                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => StudyScreen()),
                                        (Route<dynamic>route) => false);
                              },

                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),
                                primary: Colors.purple.shade900,
                                fixedSize: const Size(300, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text("Study with test"),

                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Upload your file to summarize it",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                               SizedBox(height: 15,),
                               ElevatedButton(onPressed: () async {
                                 var result = await FilePicker.platform.pickFiles(
                                   allowMultiple: true,
                                 );
                                 if(result == null) return;
                                 var file = result.files.first;
                                 Navigator.of(context).pushAndRemoveUntil(
                                     MaterialPageRoute(builder: (BuildContext context) => SummaryScreen()),
                                         (Route<dynamic>route) => false);


                               },
                                   style: ElevatedButton.styleFrom(
                                     textStyle: TextStyle(fontSize: 20),
                                     primary: Colors.purple.shade900,
                                     fixedSize: const Size(300, 55),
                                     shadowColor: Colors.transparent,
                                   ),
                                   child: Text("Upload your file")
                               )
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
