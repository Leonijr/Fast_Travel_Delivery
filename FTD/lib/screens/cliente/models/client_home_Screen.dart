import 'package:fasttravel/screens/cliente/models/client_entrega_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class clientHome extends StatefulWidget {
  const clientHome({Key? key}) : super(key: key);

  @override
  State<clientHome> createState() => _clientHomeState();
}

class _clientHomeState extends State<clientHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Card(
          color: Colors.teal[100],
          child: Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.greenAccent[700],
                leading: const Icon(Icons.people),
                title: const Text('Pedido'),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira seu nome',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'O que deseja?',
                    hintText: 'Insira seu pedido',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                    hintText: 'Local de entrega',
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190.0),
                child: Row(
                  children: [
                    const Text('Enviar pedido'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      iconSize: 40,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}