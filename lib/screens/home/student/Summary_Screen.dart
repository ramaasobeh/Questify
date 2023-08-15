import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../widget/centered_view/new.dart';
import '../../widget/navigation2.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
                        width: 900,
                        height: 1000,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 400,
                                height: 1000,
                                child:   Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 50, itemBuilder: (BuildContext context, int index) { return Text("data"); },
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
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
