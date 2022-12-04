import 'package:flutter/material.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  final mainTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        controller: mainTextController,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(hintText: 'Enter a muscle group...'),
      ),
    );
  }
}
