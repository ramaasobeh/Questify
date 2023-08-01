import 'package:flutter/material.dart';
import 'package:project1/details/details_view.dart';
import 'package:project1/screens/login/login_screen.dart';
import 'package:project1/screens/widget/centered_view/centered_view.dart';
import 'package:project1/screens/widget/navigation_bar.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CenteredView(
            child: Column(children: <Widget>[
              Navigation(),
            Expanded(child: Row(children: <Widget>[

            ],))
            ],),
          ),
        );
  }
}
