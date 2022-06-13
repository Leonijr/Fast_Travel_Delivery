import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:fasttravel/data/pedido_service.dart';
import 'package:fasttravel/screens/cliente/client_main.dart';
import 'package:fasttravel/screens/cliente/models/client_entrega_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class clientHome extends StatefulWidget {
  const clientHome({Key? key}) : super(key: key);

  @override
  State<clientHome> createState() => _clientHomeState();
}

class _clientHomeState extends State<clientHome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pedidoController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  String statusController = "preparando";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Center(
          child: Text(
            'Fast Travel Delivery - Cliente',
            style: GoogleFonts.macondo(
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              color: Colors.teal[100],
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.greenAccent[700],
                      leading: const Icon(Icons.people),
                      title: const Text('Pedido'),
                      actions: <Widget>[
                        IconButton(
                          onPressed: () {
                            nameController.clear();
                            pedidoController.clear();
                            enderecoController.clear();
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red[400],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          hintText: 'Insira seu nome',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: pedidoController,
                        decoration: const InputDecoration(
                          labelText: 'O que deseja?',
                          hintText: 'Insira seu pedido',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: enderecoController,
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                          hintText: 'Local de entrega',
                        ),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              ),
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: Colors.amber[600],
                                    title: const Text('Atenção! '),
                                    content: const Text(
                                        'Deseja enviar o pedido a loja?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context, 'Cancelar'),
                                          nameController.clear(),
                                          pedidoController.clear(),
                                          enderecoController.clear(),
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                          if (_formKey.currentState!
                                              .validate()) {
                                            PedidoService pedidoServ =
                                                PedidoService();
                                            formPedidoStatus sttsPedido =
                                                formPedidoStatus(
                                              '',
                                              nameController.text,
                                              pedidoController.text,
                                              enderecoController.text,
                                              statusController,
                                            );
                                            pedidoServ.add(sttsPedido);

                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                backgroundColor:
                                                    Colors.amber[600],
                                                title: const Text(' Alerta '),
                                                content: const Text(
                                                    'Seu pedido foi enviado a empresa e logo estará sendo preparado!'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );

                                            nameController.clear();
                                            pedidoController.clear();
                                            enderecoController.clear();
                                          }
                                        },
                                        child: const Text('Confirmar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('Enviar pedido'),
                            ),
                          )
                        ],
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
