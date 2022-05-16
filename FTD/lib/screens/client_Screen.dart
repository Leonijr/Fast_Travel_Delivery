import 'package:fasttravel/models/client.dart';
import 'package:fasttravel/models/client_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class addClient extends StatefulWidget {
  const addClient({Key? key}) : super(key: key);

  @override
  State<addClient> createState() => _addClientState();
}

class _addClientState extends State<addClient> {
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
          child: Center(
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
                Text('Cadastro de Cliente',
                    style: GoogleFonts.macondo(
                      color: Colors.green[200],
                      fontSize: 20,
                    )),
                const AddCliente(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddCliente extends StatefulWidget {
  const AddCliente({Key? key}) : super(key: key);

  @override
  State<AddCliente> createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 700,
          child: SingleChildScrollView(
            child: Card(
              child: Form(
                key: _formKey,
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
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: Validatorless.required('Nome obrigatório'),
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validatorless.multiple([
                          Validatorless.required('Email obrigatório'),
                          Validatorless.email('Email inválido'),
                        ]),
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
                        controller: enderecoController,
                        keyboardType: TextInputType.streetAddress,
                        validator:
                            Validatorless.required('Endereço obrigatório'),
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
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(
                              6, 'Senha deve ter no mínimo 6 dígitos'),
                        ]),
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
                        controller: confirmPassController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validatorless.multiple([
                          Validatorless.required('Confirmar senha obrigatória'),
                          Validatorless.min(6,
                              'Confirmar senha deve ter no mínimo 6 digitos'),
                          Validatorless.compare(
                              passwordController, 'Senhas devem ser iguais')
                        ]),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: getColor(Colors.black, Colors.purple),
                        backgroundColor: getColor(Colors.amber, Colors.green),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ClienteService service = ClienteService();
                          Client client = Client(
                              nameController.text,
                              emailController.text,
                              enderecoController.text,
                              passwordController.text,
                              confirmPassController.text);
                          service.add(client);
                        }
                      },
                      child: const Text('          Salvar          '),
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
