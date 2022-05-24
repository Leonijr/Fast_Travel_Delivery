<<<<<<< HEAD
import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/register_Screen.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/empresa/empresa_main.dart';
import 'package:fasttravel/screens/entregador/entrega_main.dart';
import 'package:flutter/material.dart';
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
            width: 320,
            height: 380,
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
                    children: const [
                      SingleChildScrollView(
                        child: Botoes(),
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
                              if (_BotoesState != 'Cliente') {
                                if (_BotoesState != 'Empresa') {
                                  if (_BotoesState != 'Entregador') {
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
                                              const EmpresaMainScreen()));
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
}

class Botoes extends StatefulWidget {
  const Botoes({Key? key}) : super(key: key);

  @override
  State<Botoes> createState() => _BotoesState();
}

class _BotoesState extends State<Botoes> {
  String valorDrop = 'Cliente';

  @override
  Widget build(BuildContext context) {
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
=======
import 'package:fasttravel/models/client.dart';
import 'package:fasttravel/models/empresa.dart';
import 'package:fasttravel/models/empresa_service.dart';
import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/screens/client_Screen.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';

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
            width: 320,
            height: 350,
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
                    children: const [
                      SingleChildScrollView(
                        child: Botoes(),
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
                                MaterialStateProperty.all(Colors.brown[400])),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            UserServices _userServices = UserServices();
                            _userServices.signIn(userLocal, onSucess: () {
                              if (_BotoesState()._verticalGroupValue ==
                                  'Cliente') {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ClienteMainScreen()));
                              } else if (_BotoesState()._verticalGroupValue ==
                                  'Empresa') {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Text('empresa')));
                              } else if (_BotoesState()._verticalGroupValue ==
                                  'Entragador') {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Text('entregador')));
                              } else {
                                const Text('Usuário Inválido');
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
}

class Botoes extends StatefulWidget {
  const Botoes({Key? key}) : super(key: key);

  @override
  State<Botoes> createState() => _BotoesState();
}

class _BotoesState extends State<Botoes> {
  String _verticalGroupValue = 'Cliente';
  List<String> _status = ['Cliente', 'Empresa', 'Entregador'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.amber,
        child: SizedBox(
          height: 40,
          width: 300,
          child: Column(
            children: <Widget>[
              RadioGroup<String>.builder(
                direction: Axis.horizontal,
                groupValue: _verticalGroupValue,
                horizontalAlignment: MainAxisAlignment.start,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value.toString();
                }),
                items: _status,
                textStyle: const TextStyle(fontSize: 10, color: Colors.black54),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> f269e6d7e9e4d53aef95b913c5b68fd7a818ad2f
