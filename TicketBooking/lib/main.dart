import 'package:flutter/material.dart';
import 'login.dart';
import 'bookFlight.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      '/booking': (context) => BookFlight(),
    },
  ));
}
