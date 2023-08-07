import 'package:flutter/material.dart';
import 'package:project1/details/details_view.dart';
import 'package:project1/screens/home/profesor/createBank.dart';
import 'package:project1/screens/login/login_screen.dart';
import 'package:project1/screens/widget/centered_view/centered_view.dart';
import 'package:project1/screens/widget/centered_view/new.dart';
import 'package:project1/screens/widget/navigation_bar.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer: Navigation(),
      appBar: AppBar(
    elevation: 20,
    actions: [
      Image.asset('assets/questify(1).png'),

    ],
    title: Text("Questify"), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white10,fontSize: 30),
    backgroundColor: Colors.deepPurple,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                   ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) => createBank()),
                              (Route<dynamic>route) => false);
                    },

                     style: ElevatedButton.styleFrom(
                       primary: Colors.black45,
                       fixedSize: const Size(300, 55),
                       shadowColor: Colors.transparent,
                     ),
                  child: const Text("Uplode your file"),

                  ),
                  Expanded(child: SingleChildScrollView(
                    child: Card(

                      child: SizedBox(

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
