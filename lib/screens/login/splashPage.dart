import 'package:flutter/material.dart';
import 'package:project1/screens/login/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToHome();

  }
  void goToHome() async{
    await Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=>  LoginPage()),
              (Route<dynamic> route)=>false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/load1.jpg",
            width: 300,
            height: 300,),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                      backgroundColor: Colors.white,

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
