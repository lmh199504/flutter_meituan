import 'package:flutter/material.dart';

class Messaage extends StatefulWidget {
  Messaage({Key key}) : super(key: key);

  @override
  _MessaageState createState() => _MessaageState();
}

class _MessaageState extends State<Messaage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Text('消息'),
        ),
      ),
    );
  }
}
