import 'package:flutter/material.dart';
import 'package:project1/screens/home/selected_questions/select_questions.dart';

import '../../widget/centered_view/new.dart';
import '../../widget/navigation_bar.dart';

class Autamtic extends StatefulWidget {
  const Autamtic({Key? key}) : super(key: key);

  @override
  State<Autamtic> createState() => _AutamticState();
}

class _AutamticState extends State<Autamtic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Navigation(),
      appBar: AppBar(
        elevation: 20,
        actions: [
          Image.asset('assets/questify(1).png'),

        ],
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
            width: 900,
            height: 1200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 700,
                        height: 800,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("template")
                            ],),
                        ),
                      ),


                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Card(
                                  child: Column(

                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: (){
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (BuildContext context) => SelectQuestion()),
                                                  (Route<dynamic>route) => false);

                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.purple.shade900,
                                          fixedSize: const Size(130, 55),
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text("New Template"),
                                      ),
                                      SizedBox(height: 20,),
                                      ElevatedButton(
                                        onPressed: (){

                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.purple.shade900,
                                          fixedSize: const Size(130, 55),
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Text("Download"),
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
