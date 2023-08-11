import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home/profesor/bank.dart';

import '../../widget/centered_view/centered_view.dart';
import '../../widget/centered_view/new.dart';
import '../../widget/navigation_bar.dart';
import '../home_view_profesor.dart';

class createBank extends StatefulWidget {
  const createBank({Key? key}) : super(key: key);

  @override
  State<createBank> createState() => _createBankState();
}

class _createBankState extends State<createBank> {
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
            height: 900,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 400,
                        height: 900,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Upload new file",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: () async {
                                var result = await FilePicker.platform.pickFiles();
                                if(result == null) return;
                                var file = result.files.first;
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => createBank()),
                                        (Route<dynamic>route) => false);

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple.shade900,
                                fixedSize: const Size(300, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child:  const Text("Upload new file"),

                            ),
                            SizedBox(height: 20,),
                            Text("click on to create your bank Question",style: TextStyle(
                                fontSize: 15,
                                color: Colors.black


                            ),),
                            SizedBox(height: 20,),

                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (BuildContext context) => Bank()),
                                        (Route<dynamic>route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple.shade900,
                                fixedSize: const Size(300, 55),
                                shadowColor: Colors.transparent,
                              ),
                              child: Text("Create The Bank"),
                            ),
                          ],
                        ),
                      ),


                      Expanded(child: SingleChildScrollView(
                        child: Center(
                          child: Column(

                            children: <Widget>[
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text("In this page you can create Bank Question or Upload another file ",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple.shade900,

                                    ),)
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      ))

                    ],))
                ],), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
