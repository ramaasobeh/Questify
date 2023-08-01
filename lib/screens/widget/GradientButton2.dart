import 'package:flutter/material.dart';
import 'package:project1/pallete.dart';
import 'package:project1/screens/login/signUpForStudent.dart';

import '../home/home_view_profesor.dart';
import '../login/chooses.dart';
class GradientButton2 extends StatelessWidget {
  const GradientButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => ChooseUser()),
                  (Route<dynamic>route) => false);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black45,
          fixedSize: const Size(395, 55),
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Sign UP',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}