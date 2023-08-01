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
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(children: <Widget>[
          Expanded(child: Row(children: <Widget>[
            DetailsView(),
            Expanded(child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    //Image.asset('assets/questify(1).png',width: 300,height: 250,),
                    const  Text(
                      'Choose your Account type',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 15),
               Padding(
                  padding: EdgeInsets.only(left:30, right:30),
                  child:DropdownButton(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       icon: const Icon(Icons.school_sharp,color: Colors.deepPurple,),
                       dropdownColor: Colors.deepPurple,
                       hint: Text('Choose'),

                       items: listItem.map(
                               (e)=>  DropdownMenuItem(child: Text(e),value: e,)
                     ).toList(),
                         onChanged: (val){
                           setState(() {
                             dropDownValue = val as String;
                             Change(dropDownValue!);
                           });
                     },
                     ),)
                  ],
                ),
              ),


            ),),
          ],))
        ],),
      ),

    );
  }
}
