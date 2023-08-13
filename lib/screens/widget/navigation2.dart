import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home/home_view_profesor.dart';

import '../../details/editInformationPro.dart';
import '../../details/edit_enformation_student.dart';
import '../home/home_view_student.dart';
import '../login/login_screen.dart';

class Navigation2 extends StatefulWidget {
  const Navigation2({Key? key}) : super(key: key);

  @override
  State<Navigation2> createState() => _Navigation2State();
}

class _Navigation2State extends State<Navigation2> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            accountName: Text("Rama Sobeh"),
            accountEmail: Text("blala@gmail.com"),
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
                MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                    (Route<dynamic>route) => false),
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Edit Information"),
            onTap: ()=> Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => EditStudent()),
                    (Route<dynamic>route) => false),
          ),
          ListTile(
            leading: Icon(Icons.bookmarks),
            title: Text("Your tests"),
            onTap: ()=> null,
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
