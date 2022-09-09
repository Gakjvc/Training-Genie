import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO organize functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: , floatingActionButton: NewSheet());
  }
  Widget Sheet(){
    return ListView()
  }

  Widget NewSheet() {
    return IconButton(
        onPressed: (() {
          setState(() {});
        }),
        icon: Icon(Icons.casino));
  }
}
void GenerateSheet(){

}
