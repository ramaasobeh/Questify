import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project1/screens/home/home_view_profesor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../constans.dart';
import '../pallete.dart';
import '../screens/home/home_view_student.dart';
import '../screens/widget/centered_view/new.dart';
import '../screens/widget/navigation2.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentpasswordController = TextEditingController();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController facultyController = TextEditingController();


  bool hidePassword = true;
  int? dropDownValue ;

  @override
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }
  var token;

  void updateUser(String firstname,lastname,email)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var action = prefs.getString("Authorization");
    try{
      Response response = await put(Uri.parse("http://"+Host+"/auth/users/me/"),
          headers: {
        "Authorization": "JWT $action"
          },
          body: {
            'first_name' : firstname,
            'last_name' : lastname,
            'email': email,
          });
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                (Route<dynamic>route) => false);

        print("update done");

        }
      else {
        var data = jsonDecode(response.body);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                content: Text(data.toString(),
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
      }
    }catch(e){
      print(e.toString());

    }
  }
  void updateStudent(int year,String university,faculty)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Authorization");
    try{
      Response response = await put(Uri.parse("http://"+Host+"/generator/students/me/"),
          headers: {
            "Authorization": "JWT $token"
          },
          body: {
            'year' : year.toString(),
            'university':university,
            'faculty':faculty,
          });
      if(response.statusCode == 200){

        print("update done 2");
      }else {
        var data = jsonDecode(response.body);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                content: Text(data.toString(),
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
      }



    }catch(e){
      print(e.toString());

    }
  }
  void callfun(){
    updateStudent(dropDownValue!, universityController.text.toString(), facultyController.text.toString());
      updateUser(firstnameController.text.toString(), lastnameController.text.toString(), emailController.text.toString());

  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation2(),
      appBar: AppBar(
        elevation: 20,

        title: Text("Questify"), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white10,fontSize: 30),
        backgroundColor: Colors.purple.shade900,
        toolbarHeight: 60, // default is 56
        toolbarOpacity: 0.5,// simple as that!
      ),
      backgroundColor: Colors.white,
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
              child: Column(children: <Widget>[
                Expanded(child: Row(children: <Widget>[
                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'Edit your infomation',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          //first name
                          const SizedBox(height: 15),
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your first name",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              controller: firstnameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'First Name',
                              ),
                            ),
                          ),
                          //last name
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your last name",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              controller: lastnameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'last Name',
                              ),
                            ),
                          ),
                          //Email
                          const SizedBox(height: 15),

                          const Text(
                            "Enter your email",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          //password
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your University ",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),

                            child: TextFormField(
                              controller: universityController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'University ',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your faculty ",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),

                            child: TextFormField(

                              controller: facultyController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'faculty ',
                              ),
                            ),
                          ),
                          //password
                          const SizedBox(height: 15),
                          const Text(
                            "ِِِِِِِِِAcademic year",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),

                          DropdownButton(
                            icon: const Icon(Icons.menu,color: Colors.deepPurple,),
                            dropdownColor: Colors.grey,
                            hint: Text(''),
                            value: dropDownValue,
                            items: <int>[1, 2, 3, 4, 5].map((int value) {
                              return new DropdownMenuItem<int>(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (val){
                              setState(() {
                                dropDownValue = val as int?;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  callfun();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade900,
                                  fixedSize: const Size(100, 55),
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                                          (Route<dynamic>route) => false);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade900,
                                  fixedSize: const Size(100, 55),
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),

                            ],
                          )


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


class Student{
  final int id;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String university;
  final String faculty;
  final String role;
  final int year;

  const Student({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.university,
    required this.faculty,
    required this.role,
    required this.year,
});
  factory Student.fromJson(Map<String,dynamic> json){
    return Student(id: json['id'] as int,
        firstname: json['first_name'] as String,
        lastname: json['last_name'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        university: json['university'] as String,
        faculty: json['faculty'] as String,
        role: json['role'] as String,
        year: json['year'] as int);
  }
}