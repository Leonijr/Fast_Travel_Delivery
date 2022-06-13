import 'package:fasttravel/login/login_screen.dart';
import 'package:fasttravel/models/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class empresaSettings extends StatefulWidget {
  const empresaSettings({Key? key}) : super(key: key);

  @override
  State<empresaSettings> createState() => _empresaSettingsState();
}

class _empresaSettingsState extends State<empresaSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Center(
          child: Text(
            'Fast Travel Delivery - Empresa',
            style: GoogleFonts.macondo(
              color: Colors.amber[700],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.brown[600],
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
                      onPressed: () async {
                        try {
                          UserServices services = new UserServices();
                          await services.signOut();
                        } catch (e) {
                          return debugPrint('$e');
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const loginScreen()));
                      },
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
                onPressed: () async {
                  try {
                    UserServices services = new UserServices();
                    await services.signOut();
                  } catch (e) {
                    return debugPrint('$e');
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const loginScreen()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
