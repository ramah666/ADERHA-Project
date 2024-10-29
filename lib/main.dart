import 'package:flutter/material.dart';
import 'package:untitled3/pages/Availablepickup.dart';
import 'package:untitled3/pages/myAppointments.dart';
import 'package:untitled3/pages/OrdersPage.dart';
import 'package:untitled3/pages/SettingsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //To Disable Debug

      home: AvailablePickup(),
    );
  }
}

