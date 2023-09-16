import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert' as convert;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/widget/centered_view/new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constans.dart';
import '../../widget/navigation_bar.dart';
import '../selected_questions/select_questions.dart';
import 'autamitic.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  late List<qua> list = [];
  bool loade = true;
  var text2 ;
  @override
  void initState() {
    super.initState();
    inFun();
  }

  void inFun() async {
    list = await fetchQUA();
    setState(() {
      loade = false;
    });
  }


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
                          child: (loade == true)
                          ?Center(child: CircularProgressIndicator())
                          :Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListView.separated(scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: EdgeInsets.all(4),
                                itemCount: list.length,
                                itemBuilder: (context,index){
                              return ListTile(trailing: Text(
                                list[index].id.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                                title: Text(
                                  "",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 21
                                  ),
                                ),
                                subtitle:Text(
                                  list[index].text,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              );
                                },  separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },),
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
Future<List<qua>> fetchQUA() async {
  final prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString("Authorization");
  var id1 = prefs.get("id");
  final response = await http.get(
      Uri.parse("http://"+Host+"/generator/lectures/"+id1.toString()+"/questions/"),
      headers: {
        "Authorization": 'JWT $action',
      });
  print(response.statusCode);
  if (response.statusCode == 200) {
    var data1 = utf8.decode(response.bodyBytes);
    List<dynamic> body = convert.jsonDecode(data1);
    List<qua> resV = body.map((dynamic item) => qua.fromJson(item)).toList();

    return resV;
  } else {
    throw Exception('Failed to load Question');
  }
}
class qua {
  final int id;
  final int lecture_id;
  final  String text;

  const qua({
    required this.id,
    required this.lecture_id,
    required this.text,


  });
  factory qua.fromJson(Map<String,dynamic> json){
    return qua(id: json['id']as int,
        lecture_id: json['lecture_id'] as int,
        text: json['text'] as String);

  }
}