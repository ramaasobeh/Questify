import 'dart:convert';
import'dart:convert' as convert;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../../constans.dart';
import '../../widget/centered_view/new.dart';
import '../../widget/navigation2.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  late List<SUM> list = [];

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 1000,
                                height: 1000,
                                child:   Column(

                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: ( context,  index) {
                                          return Text(list[index].text,style:
                                          TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),); },
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
Future<List<SUM>> fetchQUA() async {
  final prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString("Authorization");
  var id1 = prefs.get("id");
  final response = await http.get(
      Uri.parse("http://"+Host+"/generator/lectures/"+id1.toString()+"/summaries/"),
      headers: {
        "Authorization": 'JWT $action',
      });
  print(response.statusCode);
  if (response.statusCode == 200) {
    var data1 = utf8.decode(response.bodyBytes);
    List<dynamic> body = convert.jsonDecode(data1);
    List<SUM> resV = body.map((dynamic item) => SUM.fromJson(item)).toList();

    return resV;
  } else {
    throw Exception('Failed to load Question');
  }
}
class SUM {
  final int id;
  final int lecture_id;
  final  String text;

  const SUM({
    required this.id,
    required this.lecture_id,
    required this.text,


  });
  factory SUM.fromJson(Map<String,dynamic> json){
    return SUM(id: json['id']as int,
        lecture_id: json['lecture_id'] as int,
        text: json['text'] as String);

  }
}