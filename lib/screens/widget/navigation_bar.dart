import 'dart:html';
import 'dart:ui';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home/home_view_profesor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constans.dart';
import '../../details/editInformationPro.dart';
import '../../details/editPassword.dart';
import '../../details/edit_username.dart';
import '../login/login_screen.dart';
import 'package:http/http.dart' as http;
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            accountName: Container(child: FutureBuilder<User>(
              future: fetchUser(),
              builder: (context,index){
                if(index.hasData){
                  return Text(index.data!.firstname+" "+index.data!.lastname);
                }else if (index.hasError) {
                  return Text('${index.error}');
                }
                return const CircularProgressIndicator();
              },
            ),),
            accountEmail: Container(child: FutureBuilder<User>(
              future: fetchUser(),
              builder: (context,index){
                if(index.hasData){
                  return Text(index.data!.email);
                }else if (index.hasError) {
                  return Text('${index.error}');
                }
                return const CircularProgressIndicator();
              },
            ),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.purple.shade800 ,
              child: ClipOval(

                child: Image.asset('assets/avatar.png',
                  fit: BoxFit.cover,width: 50,height: 50,),

              ),
            ),

          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: ()=> Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomeView()),
                    (Route<dynamic>route) => false),
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Edit Information"),
            onTap: ()=> Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => EditInformation()),
                    (Route<dynamic>route) => false),
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text("Edit Password"),
            onTap: ()=> Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => editPassword()),
                    (Route<dynamic>route) => false),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit username"),
            onTap: ()=>Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => Editusername()),
                    (Route<dynamic>route) => false),
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
            onTap: ()=> Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic>route) => false),
          )

        ],
      ),
    );
  }
}

Future<User> fetchUser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString("Authorization");
  final response = await http.get(Uri.parse("http://"+Host+"/auth/users/me/"),
      headers: {
        "Authorization": 'JWT $action',
      }

  );
  if(response.statusCode==200){
    User res = User.fromJson(convert.jsonDecode(response.body));
    //List<dynamic> res = convert.jsonDecode(response.body);
    //List<User> user = res.map((dynamic item) => User.fromJson(item)).toList();
    return res;
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

