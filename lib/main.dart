import 'package:flutter/material.dart';
import 'package:mvsp/Presenter/Injector.dart';
import 'package:mvsp/View/ViewBody.dart';

void main() {
  Injector.configure(SystemIsIn.PRODUCTION);

  return runApp(DemoApp());
}
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'MVSP Design Pattern',
            style: TextStyle(color: Colors.grey),
          ),
          brightness: Brightness.light,
        ),
        body:ViewBody(),
      ),
    );
  }
}
