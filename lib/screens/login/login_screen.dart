import 'package:flutter/material.dart';
import 'package:project1/pallete.dart';

import '../../details/details_view.dart';
import '../home/home_view_profesor.dart';
import '../widget/centered_view/centered_view.dart';
import 'chooses.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            //set border radius more than 50% of height and width to make circle
          ),
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
                      child:Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(height: 15),

                          const SizedBox(height: 15),
                          //email
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              controller:emailController ,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
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
                          const SizedBox(height: 15),
                          //password
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                            ),
                            child: TextFormField(
                              obscureText: hidePassword,
                              controller:passwordController ,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
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
                                  hintText: 'password',
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility))
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                           ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (BuildContext context) => HomeView()),
                                      (Route<dynamic>route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade900,
                              fixedSize: const Size(395, 55),
                              shadowColor: Colors.black,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,

                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (BuildContext context) => ChooseUser()),
                                      (Route<dynamic>route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade900,
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
                        ],
                      ),
                    ),
                  ),
                  ),
                ]),
                    ),
              ],
                  ),),
                ),
        ),
      ),
    );


  }
}
