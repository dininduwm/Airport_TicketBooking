import 'package:TicketBooking/enterSeat.dart';
import 'package:TicketBooking/showShedule.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'bookFlight.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      '/booking': (context) => BookFlight(),
      '/shedules': (context) => ShowShedules(),
      '/enterSeat': (context) => EnterSeat(),
    },
  ));
}
