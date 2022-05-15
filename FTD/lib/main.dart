import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/screens/client_Screen.dart';
import 'package:fasttravel/screens/register_Screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': ((context) => const loginScreen()),
        '/addClient': ((context) => const addClient()),
      },
    );
  }
}
