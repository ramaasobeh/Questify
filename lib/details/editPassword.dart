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

class editPassword extends StatefulWidget {
  const editPassword({Key? key}) : super(key: key);

  @override
  State<editPassword> createState() => _editPasswordState();
}

class _editPasswordState extends State<editPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentpasswordController = TextEditingController();
  bool hidePassword = true;

  void setpassword(String password, current_password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var action = prefs.getString("Authorization");
    try{
      Response response = await post(Uri.parse("http://"+Host+"/auth/users/set_password/"),
          headers: {
            "Authorization": "JWT $action"
          },
          body: {
            'new_password': password,
            'current_password':current_password,

          });
      print(response.statusCode);
      if(response.statusCode == 204){
        print("update password");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                (Route<dynamic>route) => false);


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

  @override
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
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
                            'Edit your password',
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
                            "Enter your current password",
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
                              obscureText: hidePassword,
                              controller:currentpasswordController ,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
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
                                  hintText: 'current password',
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility))
                              ),
                            ),
                          ),
                          //last name
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your new password",
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
                              obscureText: hidePassword,
                              controller:passwordController ,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
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
                                  hintText: 'new password',
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility))
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  setpassword(passwordController.text.toString(), currentpasswordController.text.toString());
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
