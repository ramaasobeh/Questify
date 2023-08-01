import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          SizedBox(height: 200,
            width: 150,
            child: Image.asset('assets/questify(1).png'),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              ElevatedButton( onPressed: () { },
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                child: TextButton(onPressed: () {  },
                  style: TextButton. styleFrom(primary: Colors.black) ,
                  child: Text(",dvldv, "),
                ),
              ),
              SizedBox(width: 40,),
              ElevatedButton( onPressed: () { },
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                child: TextButton(onPressed: () {  },
                  style: TextButton. styleFrom(primary: Colors.black) ,
                  child: Text("dlmdmc"),),),
              DecoratedBox(
                decoration: BoxDecoration(
                  color:Colors.black87, //background color of dropdown button
                  border: Border.all(color: Colors.black87, width:1), //border of dropdown button
                  borderRadius: BorderRadius.circular(90),
                  image: DecorationImage(
                    image: AssetImage("assets/questify(1).png")),),
                  child:Padding(
                      padding: EdgeInsets.only(left:1, right:1),
                      child:DropdownButton(
                        items: [
                          DropdownMenuItem(
                              child: Text("profile"),
                              value: "profile",
                          onTap: (){

                          },),
                          DropdownMenuItem(child: Text("exam"),
                            value: "exam",
                            onTap: (){

                            },
                          ),
                        ],
                        onChanged: (value){
                          print("You selected $value");},
                        style: TextStyle(
                            color: Colors.white, //Font color
                           fontSize: 20 //font size on dropdown button
                           ),
                        dropdownColor: Colors.deepPurple, //dropdown background color
                         )
                  )
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

