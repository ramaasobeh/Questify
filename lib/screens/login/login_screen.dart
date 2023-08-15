import 'dart:convert';
import 'dart:html';
import 'dart:convert' as convert;
import 'package:project1/constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project1/pallete.dart';
import 'package:http/http.dart' as http;
import '../../details/details_view.dart';
import '../home/home_view_profesor.dart';
import '../home/home_view_student.dart';
import '../widget/centered_view/centered_view.dart';
import 'SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  bool hidePassword = true;
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }
  bool _isloading = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var token;
  void signIn(String username,password)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      Response response = await post(Uri.parse("http://"+Host+"/auth/jwt/create/"),
      body: {
        'username':username,
        'password':password,
      });
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        token = data["access"];
        if(data != null){
          setState(() {
            _isloading =false;
          });

          prefs.setString("Authorization",data['access']);
          token = prefs.getString("Authorization");
          String role1 = await fetchUser(token);
          if(role1 == "student"){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                    (Route<dynamic>route) => false);
          }
          if(role1 == 'professor'){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomeView()),
                    (Route<dynamic>route) => false);
          }

          



        }
      }
      if(response.statusCode==401){
        var data = jsonDecode(response.body);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: const Text('your username or password is incorrect',style: TextStyle(fontWeight: FontWeight.bold)),
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
      if(response.statusCode==400){
        var data = jsonDecode(response.body);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: const Text('your username or password is empty',style: TextStyle(fontWeight: FontWeight.bold),),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            //set border radius more than 50% of height and width to make circle
          ),
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
                      child:Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(height: 15),

                          const SizedBox(height: 15),
                          //email
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              controller:userController ,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
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
                          //password
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

                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isloading = true;
                              });

                              signIn(userController.text.toString(), passwordController.text.toString());

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade900,
                              fixedSize: const Size(395, 55),
                              shadowColor: Colors.black,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,

                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (BuildContext context) => SignUp()),
                                      (Route<dynamic>route) => false);
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
                        ],
                      ),
                    ),
                  ),
                  ),
                ]),
                    ),
              ],
                  ),),
                ),
        ),
      ),
    );


  }
}
Future<String> fetchUser(token) async {
  final prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString("Authorization");
  final response = await http.get(Uri.parse("http://"+Host+"/auth/users/me/"),
      headers: {
        "Authorization": 'JWT $token',
      }

  );

  if(response.statusCode==200){

    User res =  User.fromJson(convert.jsonDecode(response.body));
    return res.role;
  }
  else{
    throw Exception('Failed to load user');
  }
}

class User {
  final int id;
  final  String firstname;
  final  String lastname;
  final  String username;
  final  String email;
  final String role;

  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.role,


  });
  factory User.fromJson(Map<String,dynamic> json){
    return User(id: json['id']as int,
        firstname: json['first_name']as String,
        lastname: json['last_name'] as String,
        username: json['username']as String,
        role: json['role'] as String,
        email: json['email']as String);
  }

}
