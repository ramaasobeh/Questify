import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 9000),
        child: child,),
    );
  }
}
