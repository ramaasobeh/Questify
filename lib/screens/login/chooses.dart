import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/login/SignUpForProfesor.dart';
import 'package:project1/screens/login/signUpForStudent.dart';

import '../../details/details_view.dart';
import '../widget/centered_view/centered_view.dart';
import '../../pallete.dart';

class ChooseUser extends StatefulWidget {
  @override
  State<ChooseUser> createState() => _ChooseUser();
}
class _ChooseUser extends State<ChooseUser> {
  String? dropDownValue = 'Student' ;
  List listItem = ['Student','Profesor'];
  void Change(String s){
    if (s == 'Student')
      {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => SignUpStudet()),
                (Route<dynamic>route) => false);
      }
    if (s == 'Profesor')
    {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignUpForProfesor()),
              (Route<dynamic>route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
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
              child: Column(children: <Widget>[
                Expanded(child: Row(children: <Widget>[
                  DetailsView(),
                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: <Widget>[
                          //Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const  Text(

                            'Choose your Account type',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,


                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => SignUpStudet()),
                                        (Route<dynamic>route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                fixedSize: const Size(150, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                'Student',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),

                          ),
                          const SizedBox(height: 15),
                          const  Text(

                            'OR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurple,



                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => SignUpForProfesor()),
                                        (Route<dynamic>route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                fixedSize: const Size(150, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                'Profesor',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),),
                ],))
              ],), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
