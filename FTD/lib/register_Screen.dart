import 'package:fasttravel/screens/cliente/client_Screen.dart';
import 'package:fasttravel/screens/empresa/empresa_Screen.dart';
import 'package:fasttravel/screens/entregador/entrega_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
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
              const SizedBox(height: 20),
              const registrar(),
            ],
          ),
        ),
      ),
    );
  }
}

class registrar extends StatelessWidget {
  const registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qual o seu Perfil?',
                style:
                    GoogleFonts.macondo(color: Colors.green[400], fontSize: 25),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.amberAccent[100],
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const addClient()));
                        },
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/add_cliente.png'),
                              height: 80,
                            ),
                            Text('Cliente',
                                style: GoogleFonts.poppins(
                                    color: Colors.lightBlue))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Material(
                    color: Colors.amberAccent[100],
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const addEmpresa()));
                        },
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/add_empresa.png'),
                              height: 80,
                            ),
                            Text('Empresa',
                                style: GoogleFonts.poppins(
                                    color: Colors.lightBlue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Material(
                    color: Colors.amberAccent[100],
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const addEntrega()));
                        },
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/add_entrega.png'),
                              height: 80,
                            ),
                            Text('Entrega',
                                style: GoogleFonts.poppins(
                                    color: Colors.lightBlue))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
