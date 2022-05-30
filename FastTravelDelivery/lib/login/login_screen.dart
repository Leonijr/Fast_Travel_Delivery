import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/register_Screen.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/empresa/empresa_main.dart';
import 'package:fasttravel/screens/entregador/entrega_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String valorDrop = 'Cliente';
  String? tipo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(24, 25, 25, 112),
          useMaterial3: true),
      home: Consumer<UserServices>(
        builder: (_, _userServices, child) {
          return Scaffold(
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
          );
        },
      ),
    );
  }

  Widget CardElevado() {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    UserLocal userLocal = UserLocal(id: '', email: '', password: '');

    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Botoes(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.brown[800])),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            UserServices _userServices = UserServices();
                            _userServices.signIn(userLocal, onSucess: () {
                              debugPrint('valor $tipo');
                              if (tipo != 'Cliente') {
                                if (tipo != 'Empresa') {
                                  if (tipo != 'Entregador') {
                                    const SnackBar(
                                      content: Text('Acesso inválido'),
                                    );
                                  } else {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntregaMainScreen()));
                                  }
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmpresaMainScreen(userLocal)));
                                }
                              } else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ClienteMainScreen()));
                              }
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
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

  Widget Botoes() {
    return Column(
      children: [
        Column(
          children: [
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(8),
              dropdownColor: Colors.brown[800],
              value: valorDrop,
              icon: const Icon(Icons.touch_app_outlined),
              elevation: 50,
              style: GoogleFonts.macondo(
                color: Colors.green[700],
              ),
              onChanged: (String? newValue) {
                setState(() {
                  valorDrop = newValue.toString();
                  tipo = valorDrop;
                });
              },
              items: <String>['Cliente', 'Empresa', 'Entregador']
                  .map<DropdownMenuItem<String>>((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(valor),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
