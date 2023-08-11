import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/home/home_view_profesor.dart';

import '../../details/editInformationPro.dart';
import '../login/login_screen.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

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

