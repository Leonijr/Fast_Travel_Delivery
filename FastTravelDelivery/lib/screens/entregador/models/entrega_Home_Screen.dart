import 'package:fasttravel/screens/entregador/models/entrega_Entregas_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class entregaHome extends StatefulWidget {
  const entregaHome({Key? key}) : super(key: key);

  @override
  State<entregaHome> createState() => _entregaHomeState();
}

class _entregaHomeState extends State<entregaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Center(
          child: Text(
            'Fast Travel Delivery - Entrega',
            style: GoogleFonts.macondo(
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[600],
          onPressed: () {},
          child: const Icon(Icons.refresh_rounded)),
    );
  }
}
