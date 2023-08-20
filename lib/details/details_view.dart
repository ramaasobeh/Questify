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
        color: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[

    Text('Questify',style: TextStyle(color:Colors.white ,fontWeight: FontWeight.bold,height: 0.9,fontSize: 60),),
    SizedBox(height: 30,
    ),
    Text("تقدّم المنصّة ميزة الدراسة التفاعلية والتقييم الذاتي للطلّاب، وميزة تحضير بنك أسئلة مع اختبار بشكل تلقائي للمعلّمين. ",
      style: TextStyle(color:Colors.white  ,fontWeight: FontWeight.bold,fontSize: 30,height: 1.7),)
    ],
    ),));
  }
}
