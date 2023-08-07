import 'package:flutter/material.dart';
import 'package:project1/screens/home/home_view_profesor.dart';

import '../../details/details_view.dart';
import '../../pallete.dart';
import '../widget/GradientButton2.dart';
import '../widget/centered_view/centered_view.dart';
import '../widget/gradientButton.dart';
import '../widget/gradientButton_forSignup.dart';
import 'login_screen.dart';

class SignUpForProfesor extends StatelessWidget {
  const SignUpForProfesor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          elevation: 200,
          shadowColor: Colors.black,
          color: Colors.white,
          child: SizedBox(
            width: 1000,
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Expanded(child: Row(children: <Widget>[
                  DetailsView(),
                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'SignUp As Professor',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          //first name
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your first name",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'First Name',
                              ),
                            ),
                          ),
                          //last name
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your last name",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'last Name',
                              ),
                            ),
                          ),
                          //Email
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your Email",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          //password
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your Password",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(27),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(color: Pallete.borderColor, width: 3,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Pallete.gradient2,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const GradientButtonForSignup(),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account",
                                  style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                                child: const Text('Login',
                                    style:
                                    TextStyle(fontSize: 18, color:Colors.black)),
                              ),
                            ],

                          )
                        ],
                      ),
                    ),
                  ),),
                ],))
              ],), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
    );
  }
}
