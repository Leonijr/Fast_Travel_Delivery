import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/screens/cliente/client_Screen.dart';
import 'package:fasttravel/screens/cliente/models/client_Settings_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserServices(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': ((context) => const loginScreen()),
        },
      ),
    );
  }
}
