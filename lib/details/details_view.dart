import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ABOUT',style: TextStyle(fontWeight: FontWeight.w800,height: 0.9,fontSize: 60),),
          SizedBox(height: 30,
          ),
          Text("detalis my name is rama ",style: TextStyle(fontSize: 21,height: 1.7),)
        ],
      ),
    );
  }
}
