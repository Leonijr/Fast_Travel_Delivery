import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/screens/client_Screen.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(24, 25, 25, 112),
          useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: const Center(
            child: Text('Fast Travel Delivery'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Image(
                image: AssetImage('assets/logo_inicio.png'),
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
              Text(
                'Fast Travel Delivery',
                style: GoogleFonts.macondo(
                  color: Colors.green[200],
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 100),
              CardElevado(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardElevado extends StatelessWidget {
  CardElevado({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserLocal userLocal = UserLocal(id: '', email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 280,
            height: 290,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => userLocal.email = value!,
                    initialValue: userLocal.email,
                    decoration: InputDecoration(
                      hintText: 'Email: ',
                      hintStyle: const TextStyle(fontSize: 10),
                      prefixIcon: const Icon(Icons.email),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 20, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um e-mail';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (value) => userLocal.password = value!,
                    initialValue: userLocal.password,
                    decoration: InputDecoration(
                      hintText: 'Senha: ',
                      hintStyle: const TextStyle(fontSize: 10),
                      prefixIcon: const Icon(Icons.key),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 20, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma senha';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            UserServices _userServices = UserServices();
                            _userServices.signIn(userLocal, onSucess: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ClienteMainScreen()));
                            }, onFail: (e) {
                              Text('$e');
                            });
                          }
                        },
                        child: Text(
                          'Entrar',
                          style: GoogleFonts.macondo(color: Colors.green[400]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const registerScreen(),
                                  ));
                            },
                            child: Text(
                              'Ainda não possui login? Cadastre-se aqui',
                              style:
                                  GoogleFonts.macondo(color: Colors.green[400]),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
