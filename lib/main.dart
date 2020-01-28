import 'package:GroupChat/views/chat.dart';
import 'package:GroupChat/views/login.dart';
import 'package:GroupChat/views/reg.dart';
import 'package:GroupChat/views/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => Splash(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        Chat.id: (context) => Chat()
      },
    );
  }
}
