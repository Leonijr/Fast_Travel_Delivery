import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class empresaEntregas extends StatefulWidget {
  const empresaEntregas({Key? key}) : super(key: key);

  @override
  State<empresaEntregas> createState() => _empresaEntregasState();
}

class _empresaEntregasState extends State<empresaEntregas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Fast Travel Delivery - Empresa',
            style: GoogleFonts.macondo(
              color: Colors.amber[700],
            ),
          ),
        ),
      ),
      body: const Text('dados operacionais ok'),
    );
  }
}
