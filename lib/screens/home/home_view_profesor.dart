import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:project1/constans.dart';
import 'package:http/http.dart'as http;
import 'package:project1/details/details_view.dart';
import 'package:project1/screens/home/profesor/bank.dart';
import 'package:project1/screens/home/profesor/createBank.dart';
import 'package:project1/screens/login/login_screen.dart';
import 'package:project1/screens/widget/centered_view/centered_view.dart';
import 'package:project1/screens/widget/centered_view/new.dart';
import 'package:project1/screens/widget/navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isLoading = false;
  Stream<List<int>> convertUint8ListToStream(Uint8List uint8List) {
    return Stream.fromIterable([uint8List.toList()]);
  }
  Future<void> pickAndUploadFile(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var action = prefs.getString("Authorization");
      print(action);
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        Uint8List? uploadFile = result.files.single.bytes;
        String filename = result.files.single.name;

        print(filename);
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://'+Host+'/generator/file_upload/'),
        );

        request.headers["Authorization"] = "JWT $action";

        request.files.add(http.MultipartFile(
          'file',
          http.ByteStream.fromBytes(uploadFile!),
          uploadFile.length,
          filename: filename,
        ));
        setState(() {
          _isLoading = true;
        });

        var response = await http.Response.fromStream(await request.send());
        print(response.statusCode);


        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());

          print(data);
          var id = data["id"];

          prefs.setInt("id", id);

          print(id);
          try{
            Response response2 = await post(Uri.parse('http://'+Host+'/generator/lectures/'+id.toString()+'/questions/'),

            headers: {
              "Authorization": "JWT $action",
            },

            );
            print(response2.statusCode);
            if(response2.statusCode==201){
              if(response2.body != null){
                setState(() {
                  _isLoading = false;
                });
              }
              print("sdsdsd");
              print(response2.body);

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => createBank()),
                    (Route<dynamic> route) => false,);
            }
            else{
              var data3 = jsonDecode(response2.body);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content:  Text(data3.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () =>  Navigator.pop(context, 'ok'),
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
      else{
          var data2 = jsonDecode(response.body);
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content:  Text(data2.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () =>  Navigator.pop(context, 'ok'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );

        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer: Navigation(),
      appBar:AppBar(
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
            width: 800,
            height: 800,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

                children: <Widget>[
                Expanded(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Upload your file (word document)",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black
                    ),
                    ),

                    SizedBox(height: 20,),
                    ElevatedButton(
                    onPressed: (_isLoading==true)?null
                      :() async {

                      pickAndUploadFile(context);
                    },
                     style: ElevatedButton.styleFrom(
                       primary: Colors.purple.shade900,
                       fixedSize: const Size(300, 55),
                       shadowColor: Colors.transparent,
                     ),
                  child:  const Text("Upload your file"),

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
