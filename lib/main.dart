import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zuiyou/routes/routes.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff1695e1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
