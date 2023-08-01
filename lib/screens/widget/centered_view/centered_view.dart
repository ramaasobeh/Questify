import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage("assets/background/background2.jpg"),fit: BoxFit.cover,
        ),
    ),
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 9000),
        child: child,),
    );
  }
}
