import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/constans.dart';
import 'package:project1/screens/home/home_view_profesor.dart';
import 'package:http/http.dart';
import 'package:project1/screens/home/home_view_student.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../details/details_view.dart';
import '../../pallete.dart';
import '../widget/centered_view/centered_view.dart';
import 'login_screen.dart';
import 'dart:html';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();

}


class _SignUpState extends State<SignUp> {
  TextEditingController firstNameControl = TextEditingController();
  TextEditingController lastNameControl = TextEditingController();
  TextEditingController userNameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  bool _isLoading = false;

  bool hidePassword = true;
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }

  void signup(String firstName, lastName, userName,email,password) async{
    SharedPreferences pre = await SharedPreferences.getInstance();
    try{
       Response response = await post(Uri.parse("http://"+Host+"/auth/users/"),

      body:{
        'first_name' : firstName,
        'last_name' : lastName,
        'email': email,
        'username': userName,
        'password': password
          });
      if(response.statusCode==201){
        var data = jsonDecode(response.body.toString());
        if(data!=null){
          setState(() {
            _isLoading = false;
          });
          Text(response.body);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic>route) => false);



        }else{

          setState(() {
            _isLoading = false;

          });
          Text(response.body);
        }

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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: Column(children: <Widget>[
                Expanded(child: Row(children: <Widget>[
                  DetailsView(),
                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'SignUp ',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          //first name
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
                              controller:firstNameControl ,
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
                              controller: lastNameControl,
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
                            "Enter your User name",
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
                              controller:userNameControl,
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
                                hintText: 'User Name',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          const Text(
                            "Enter your Email",
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
                              controller: emailControl,
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
                            "Enter your Password",
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
                              controller:passwordControl ,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.key),
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
                                hintText: 'password',
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(Icons.visibility)),

                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            signup(firstNameControl.text.toString(), lastNameControl.text.toString(),
                                userNameControl.text.toString(),
                                emailControl.text.toString(), passwordControl.text.toString());

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple.shade900,
                            fixedSize: const Size(395, 55),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Sign UP',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account",
                                  style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                                child: const Text('Login',
                                    style:
                                    TextStyle(fontSize: 18, color:Colors.black)),
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
