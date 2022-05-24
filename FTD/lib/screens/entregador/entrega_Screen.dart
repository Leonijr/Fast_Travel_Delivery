import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/models/entregador.dart';
import 'package:fasttravel/models/entregador_service.dart';
import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class addEntrega extends StatefulWidget {
  const addEntrega({Key? key}) : super(key: key);

  @override
  State<addEntrega> createState() => _addEntregaState();
}

class _addEntregaState extends State<addEntrega> {
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
                Text('Cadastro de Entregador',
                    style: GoogleFonts.macondo(
                      color: Colors.green[200],
                      fontSize: 20,
                    )),
                const AddEntregador(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddEntregador extends StatefulWidget {
  const AddEntregador({Key? key}) : super(key: key);

  @override
  State<AddEntregador> createState() => _AddEntregadorState();
}

class _AddEntregadorState extends State<AddEntregador> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController veiculoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                          Validatorless.email('email inválido'),
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
                      'CPF(apenas números)',
                      style: GoogleFonts.macondo(
                          color: Colors.black87, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: cpfController,
                        keyboardType: TextInputType.number,
                        validator: Validatorless.multiple([
                          Validatorless.required('CPF obrigatório'),
                          Validatorless.min(11, 'Cpf deve conter 11 números'),
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
                      'Veículo',
                      style: GoogleFonts.macondo(
                          color: Colors.black87, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: veiculoController,
                        keyboardType: TextInputType.text,
                        validator: Validatorless.required(
                            'Informar nome e ano do veículo'),
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
                          Validatorless.required('Senha Obrigatória'),
                          Validatorless.min(
                              6, 'Senha deve ter no mínimo 6 digitos'),
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
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validatorless.multiple([
                          Validatorless.required('Confirmar senha obrigatório'),
                          Validatorless.min(6,
                              'Confirmar senha deve ter no mínimo 6 caracteres'),
                          Validatorless.compare(
                              passwordController, 'Senhas devem ser iguais'),
                        ]),
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
                          foregroundColor:
                              getColor(Colors.black, Colors.purple),
                          backgroundColor: getColor(Colors.amber, Colors.green),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            EntregadorService service = EntregadorService();
                            Entregador entregador = Entregador(
                                nameController.text,
                                emailController.text,
                                cpfController.text,
                                veiculoController.text,
                                passwordController.text,
                                confirmPasswordController.text);
                            service.add(entregador);

                            UserServices Users = UserServices();
                            Users.signUp(
                                UserLocal(
                                  id: 'id',
                                  email: emailController.text,
                                  password: passwordController.text,
                                ), onSucess: () {
                              _showDialog(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const loginScreen(),
                                  ));
                            }, onFail: (e) {
                              const ScaffoldMessenger(
                                child: SnackBar(
                                  content: Text('Falha ao registrar usuário'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });
                          }
                        },
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
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text("Aviso!"),
        content: Text("Perfil entregador criado com sucesso!"),
        backgroundColor: Colors.lightGreen,
      );
    },
  );
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
