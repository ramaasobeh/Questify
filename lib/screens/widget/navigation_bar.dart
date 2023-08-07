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
            accountName: Text("Edit Information"),
            accountEmail: Text("exam"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/avatar.png',
                  fit: BoxFit.cover,width: 50,height: 50,),

              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,

            ),
          ),

        ],
      ),
    );
  }
}

