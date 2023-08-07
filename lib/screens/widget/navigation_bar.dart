import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              backgroundColor: Colors.deepPurple,
              child: ClipOval(

                child: Image.asset('assets/avatar.png',
                  fit: BoxFit.cover,width: 50,height: 50,),

              ),
            ),

          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Edit Information"),
            onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.branding_watermark_sharp),
            title: Text("your Exam"),
            onTap: ()=> null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
            onTap: ()=> null,
          )

        ],
      ),
    );
  }
}

