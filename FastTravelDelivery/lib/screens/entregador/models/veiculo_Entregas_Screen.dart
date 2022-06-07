import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class veiculoEntregas extends StatefulWidget {
  const veiculoEntregas({Key? key}) : super(key: key);

  @override
  State<veiculoEntregas> createState() => _veiculoEntregasState();
}

class _veiculoEntregasState extends State<veiculoEntregas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Fast Travel Delivery - Entrega ',
            style: GoogleFonts.macondo(
              color: Colors.amber[600],
            ),
          ),
        ),
      ),
    );
  }
}
