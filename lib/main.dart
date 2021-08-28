import 'package:flutter/material.dart';
import 'package:yoo_pizza/views/screens/pizza_home_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YooPizza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PizzaHomeMain(),
    );
  }
}
