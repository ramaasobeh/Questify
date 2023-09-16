import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project1/screens/widget/navigation2.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert' as convert;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/widget/centered_view/new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constans.dart';
import '../../../pallete.dart';
import '../../widget/navigation_bar.dart';
import '../selected_questions/select_questions.dart';
import '../../widget/centered_view/new.dart';
import '../../widget/navigation_bar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController answerController = TextEditingController();
  bool _isloading = false;
  void answer(int question_id,String answer)async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString("Authorization");
    var id1 = prefs.get("id");
    try{
      Response response = await post(Uri.parse("http://"+Host+"/generator/lectures/"+id1.toString()+"/questions/"+question_id.toString()+"/student_answers/"),
          headers: {
            "Authorization": 'JWT $action',
          },
          body: {
        'text':answer
          }

      );
      print(response.statusCode);
      print(response.body);

      if(response.statusCode == 201){
        var data = jsonDecode(response.body.toString());
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content:  Text("your answer is : "+data['result'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        Text(data.toString());
        }

      else{
        var data = jsonDecode(response.body);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content:  Text(data.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }

    }catch(e){
      print(e.toString());

    }
  }

  late List<qua> list = [];
  bool loade = false;
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
    return  Scaffold(
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
            width: 1200,
            height: 1200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 900,
                        height: 900,
                        child: SingleChildScrollView(
                          child: (loade == true)
                              ?Center(child: CircularProgressIndicator())
                              :Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ListView.separated(scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: EdgeInsets.all(4),
                                itemCount: list.length,
                                itemBuilder: (context,index){
                                print(list[index].id.toString());
                                  List<TextEditingController> controllers = List.generate(list.length , (index) => TextEditingController(),);

                                  return ListTile(trailing: Text(
                                    index.toString(),


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
                                    subtitle:Column(
                                      children: [
                                        Text(
                                          list[index].text,
                                          style:
                                          TextStyle(color: Colors.black, fontSize: 20),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [

                                            ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                maxWidth: 600,
                                                maxHeight: 80,
                                              ),
                                              child: TextFormField(

                                                controller: controllers[index],

                                                decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.all(27),
                                                  enabledBorder: OutlineInputBorder (
                                                    borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                                    borderRadius: BorderRadius.circular(10),),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Pallete.gradient2,
                                                      width: 3,
                                                    ),
                                                    borderRadius: BorderRadius.circular(10),),
                                                  hintText: 'your answer',


                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15,),

                                            ElevatedButton(onPressed: (){
                                              answer(list[index].id, controllers[index].text.toString());
                                            }, style: ElevatedButton.styleFrom(
                                              textStyle: TextStyle(fontSize: 20),

                                              primary: Colors.purple.shade900,
                                              fixedSize: const Size(60, 50),
                                              shadowColor: Colors.transparent,
                                            ),
                                                child: Text("OK"))
                                          ],
                                        )



                                      ],
                                    )
                                  );
                                },  separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },),
                            ],),
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
