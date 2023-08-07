import 'package:flutter/material.dart';

import '../../widget/centered_view/centered_view.dart';
import '../home_view_profesor.dart';

class createBank extends StatefulWidget {
  const createBank({Key? key}) : super(key: key);

  @override
  State<createBank> createState() => _createBankState();
}

class _createBankState extends State<createBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Expanded(child: Row(children: <Widget>[

                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) => HomeView()),
                              (Route<dynamic>route) => false);
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      fixedSize: const Size(300, 55),
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text("Uplode new file"),

                  ),

                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [

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
