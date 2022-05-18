import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/models/empresa.dart';
import 'package:fasttravel/models/empresa_service.dart';
import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

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
              const AddEmpr(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddEmpr extends StatefulWidget {
  const AddEmpr({Key? key}) : super(key: key);

  @override
  State<AddEmpr> createState() => _AddEmprState();
}

class _AddEmprState extends State<AddEmpr> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
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
                      'cnpj(apenas números)',
                      style: GoogleFonts.macondo(
                          color: Colors.black87, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: cnpjController,
                        keyboardType: TextInputType.number,
                        validator: Validatorless.multiple([
                          Validatorless.required('Cnpj obrigatório'),
                          Validatorless.min(14, 'Cnpj deve conter 14 números'),
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
                        controller: confirmPassController,
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
                            EmpresaService service = EmpresaService();
                            Empresa empresa = Empresa(
                                nameController.text,
                                emailController.text,
                                cnpjController.text,
                                enderecoController.text,
                                passwordController.text,
                                confirmPassController.text);
                            service.add(empresa);

                            UserServices Users = UserServices();
                            Users.signUp(
                                UserLocal(
                                    id: 'id',
                                    email: emailController.text,
                                    password: passwordController.text),
                                onSucess: () {
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
        content: Text("Perfil da empresa criado com sucesso!"),
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
