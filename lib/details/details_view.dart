import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 520,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage("assets/background/background2.jpg"),
              fit:BoxFit.cover,opacity:20
          ),
        ),
        child: Card(
        color: Colors.white10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[

    Text('ABOUT',style: TextStyle(color:Colors.white ,fontWeight: FontWeight.w900,height: 0.9,fontSize: 60),),
    SizedBox(height: 30,
    ),
    Text("detalis my name is rama ",style: TextStyle(color:Colors.white ,fontWeight: FontWeight.w900,fontSize: 21,height: 1.7),)
    ],
    ),));
  }
}
