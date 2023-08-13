import 'package:flutter/material.dart';

import '../pallete.dart';
import '../screens/home/home_view_student.dart';
import '../screens/widget/centered_view/new.dart';
import '../screens/widget/navigation2.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  bool hidePassword = true;
  int? dropDownValue ;

  @override
  void _togglePasswordView(){

    setState(() {
      hidePassword =! hidePassword;
    });
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation2(),
      appBar: AppBar(
        elevation: 20,

        title: Text("Questify"), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white10,fontSize: 30),
        backgroundColor: Colors.purple.shade900,
        toolbarHeight: 60, // default is 56
        toolbarOpacity: 0.5,// simple as that!
      ),
      backgroundColor: Colors.white,
      body: newCenter(
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
                  Expanded(child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          // Image.asset('assets/questify(1).png',width: 300,height: 250,),
                          const Text(
                            'Edit your infomation',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          //first name
                          const SizedBox(height: 15),
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
                            dropdownColor: Colors.grey,
                            hint: Text(''),
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
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade900,
                                  fixedSize: const Size(100, 55),
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (BuildContext context) => HomeViewStudent()),
                                          (Route<dynamic>route) => false);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade900,
                                  fixedSize: const Size(100, 55),
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
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
