import 'package:flutter/material.dart';

import '../../details/details_view.dart';
import '../../pallete.dart';
import '../widget/GradientButton2.dart';
import '../widget/centered_view/centered_view.dart';
import '../widget/gradientButton.dart';
import '../widget/gradientButton_forSignup.dart';
import 'login_screen.dart';

class SignUpStudet extends StatefulWidget {
  @override
  State<SignUpStudet> createState() => _SignUpStudetState();
}
class _SignUpStudetState extends State<SignUpStudet> {
  bool hidePassword = true;
  int? dropDownValue ;

  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                          //Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'SignUp As Student',
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
                          const SizedBox(height: 15),
                          const Text(
                            "Enter your University Specialization",
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
                                hintText: 'University Specialization',
                              ),
                            ),
                          ),
                          //password
                          const SizedBox(height: 15),
                          const SizedBox(height: 15),
                          const Text(
                            "ِِِِِِِِِAcademic year",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 15),

                          DropdownButton(

                            icon: const Icon(Icons.menu,color: Colors.deepPurple,),
                            dropdownColor: Colors.deepPurple,
                            hint: Text('Choose'),
                            value: dropDownValue,
                            items: <int>[1, 2, 3, 4, 5].map((int value) {
                              return new DropdownMenuItem<int>(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (val){
                              setState(() {
                                dropDownValue = val as int?;
                              });
                            },
                          ),
                          //password
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
