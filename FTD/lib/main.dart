import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/screens/client_Screen.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/register_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/log',
      routes: {
        '/log': ((context) => const loginScreen()),
        '/addClient': ((context) => const addClient()),
      },
    );
  }
}
