import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  String? number;
  String? password;


  Test({this.number, this.password});
//  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is 3rd page"),
      ),
      body: Center(child: Text("Number is: ${widget.number}\nPassword is:${widget.password}")),
    );
  }
}
