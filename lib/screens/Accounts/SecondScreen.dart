import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final BuildContext context;

  SecondScreen(this.context);///here u have to call the build Context of FirstScreen

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: SecondScreenScreen(this.context));
  }
}

class SecondScreenScreen extends StatefulWidget {
  final BuildContext context;

  SecondScreenScreen(this.context);/// and here also.

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new RaisedButton(onPressed: (){
          Navigator.pop(widget.context);///this context is passed from firstScreen
        },
          child: new Text('Go Back'),
        ),
      ),
    );
  }
}