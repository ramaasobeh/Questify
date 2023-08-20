import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/screens/home/selected_questions/selected_questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1/screens/home/Provider/favourite_provider.dart';
import 'package:project1/screens/home/Provider/select_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constans.dart';
import '../../widget/centered_view/new.dart';
import '../../widget/navigation_bar.dart';

class SelectedQuestion extends StatefulWidget {
  const SelectedQuestion({Key? key}) : super(key: key);

  @override
  State<SelectedQuestion> createState() => _SelectedQuestionState();
}

class _SelectedQuestionState extends State<SelectedQuestion> {

  List<int> select = [];
  late List<qua> list = [];
  bool loade = true;

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
    final favoriteProvider = Provider.of<SelectIem>(context);

    return Scaffold(
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
            height: 1000,
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:Column(
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
                              Card(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 600,
                                      height: 1000,
                                      child:  Column(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: favoriteProvider.select.length,
                                              itemBuilder : (context, index){
                                                final int value1 = favoriteProvider.select[index];
                                                return Consumer<SelectIem>(builder: (context, value, child){
                                                  return ListTile(
                                                    onTap: (){
                                                      if(value.select.contains(index)){
                                                        value.removeItem(value1);
                                                      }else {
                                                        value.addItem(value1);
                                                      }
                                                    },

                                                    title: Text(list[value1].text+index.toString()),
                                                    trailing: Icon(
                                                        value.select.contains(value1)? Icons.add_box :Icons.add_box_outlined),
                                                  );
                                                });
                                              },),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],),
                        ),
                      ),


                      Expanded(child: Center(
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
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
                            ))


                          ],
                        ),
                      ))
                    ],
                  ))

                ],
              ),
            ),
          ),
        ),),
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