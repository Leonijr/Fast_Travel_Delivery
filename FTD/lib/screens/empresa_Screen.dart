import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addEmpresa extends StatefulWidget {
  const addEmpresa({Key? key}) : super(key: key);

  @override
  State<addEmpresa> createState() => _addEmpresaState();
}

class _addEmpresaState extends State<addEmpresa> {
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
              const SizedBox(
                height: 20,
              ),
              Text('Cadastro da Empresa',
                  style: GoogleFonts.macondo(
                    color: Colors.green[200],
                    fontSize: 20,
                  )),
              const addEmpr(),
            ],
          ),
        ),
      ),
    );
  }
}

class addEmpr extends StatelessWidget {
  const addEmpr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 700,
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nome',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'email',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'cnpj',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'endereço',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'senha',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'confirmar senha',
                    style: GoogleFonts.macondo(
                        color: Colors.black87, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: getColor(Colors.black, Colors.purple),
                        backgroundColor: getColor(Colors.amber, Colors.green),
                      ),
                      onPressed: () {},
                      child: const Text('          Salvar          '),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  // ignore: prefer_function_declarations_over_variables
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
