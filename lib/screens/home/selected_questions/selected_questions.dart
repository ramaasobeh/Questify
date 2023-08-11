import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1/screens/home/Provider/favourite_provider.dart';
import '../../widget/centered_view/new.dart';
import '../../widget/navigation_bar.dart';

class SelectedQuestion extends StatefulWidget {
  const SelectedQuestion({Key? key}) : super(key: key);

  @override
  State<SelectedQuestion> createState() => _SelectedQuestionState();
}

class _SelectedQuestionState extends State<SelectedQuestion> {
  List<int> select = [];

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavItem>(context);

    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        elevation: 20,
        actions: [
          Image.asset('assets/questify(1).png'),

        ],
        title: Text("Questify"), centerTitle: true, titleTextStyle: TextStyle(color: Colors.white10,fontSize: 30),
        backgroundColor: Colors.purple.shade900,
        toolbarHeight: 60, // default is 56
        toolbarOpacity: 0.5,// simple as that!
      ),
      body: newCenter(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
          elevation: 200,
          shadowColor: Colors.black,
          color: Colors.white,
          child: SizedBox(
            height: 1000,
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:Column(
                children: <Widget>[
                  Expanded(child: Row(

                    children: <Widget>[
                      SizedBox(
                        width: 700,
                        height: 800,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 600,
                                      height: 1000,
                                      child:  Column(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: favoriteProvider.select.length,
                                              itemBuilder : (context, index){
                                                return Consumer<FavItem>(builder: (context, value, child){
                                                  return ListTile(
                                                    onTap: (){
                                                      if(value.select.contains(index)){
                                                        value.removeItem(index);
                                                      }else {
                                                        value.addItem(index);
                                                      }
                                                    },
                                                    title: Text('Item'+index.toString()),
                                                    trailing: Icon(
                                                        value.select.contains(index)? Icons.add_box :Icons.add_box_outlined),
                                                  );
                                                });
                                              },),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],),
                        ),
                      ),


                      Expanded(child: Center(
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple.shade900,
                                    fixedSize: const Size(130, 55),
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Text("Download"),
                                ),
                              ],
                            ))


                          ],
                        ),
                      ))
                    ],
                  ))

                ],
              ),
            ),
          ),
        ),),
    );
  }
}

