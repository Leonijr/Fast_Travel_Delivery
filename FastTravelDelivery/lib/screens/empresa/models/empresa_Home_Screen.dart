import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:fasttravel/screens/empresa/models/empresa_Entregas_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class empresaHome extends StatefulWidget {
  const empresaHome({Key? key}) : super(key: key);

  @override
  State<empresaHome> createState() => _empresaHomeState();
}

class _empresaHomeState extends State<empresaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Center(
          child: Text(
            'Fast Travel Delivery - Empresa',
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
