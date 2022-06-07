import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class entregadorSettings extends StatefulWidget {
  const entregadorSettings({Key? key}) : super(key: key);

  @override
  State<entregadorSettings> createState() => _entregadorSettingsState();
}

class _entregadorSettingsState extends State<entregadorSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
          child: Text(
            'Fast Travel Delivery - Empresa',
            style: GoogleFonts.macondo(
              color: Colors.blue[800],
            ),
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  padding: const EdgeInsets.all(8),
                  textStyle: GoogleFonts.macondo(),
                  primary: const Color(0xFF76FF03),
                ),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
