import 'package:fasttravel/models/user_services.dart';
import 'package:fasttravel/screens/empresa/models/empresa_Settings_Screen.dart';
import 'package:fasttravel/screens/empresa/models/empresa_Concluid_Screen.dart';
import 'package:fasttravel/screens/empresa/models/empresa_Entregas_Screen.dart';
import 'package:fasttravel/screens/empresa/models/empresa_Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/user_local.dart';

class EmpresaMainScreen extends StatefulWidget {
  final UserLocal _userLocal;
  const EmpresaMainScreen(this._userLocal, {Key? key}) : super(key: key);

  @override
  State<EmpresaMainScreen> createState() => _EmpresaMainScreenState();
}

class _EmpresaMainScreenState extends State<EmpresaMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(24, 25, 25, 112),
          useMaterial3: true),
      home: const Scaffold(
        body: NavBar(),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    empresaHome(),
    EmpresaConcluid(),
    entregasEmpresa(),
    configsEmpresa(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: Colors.blue[900],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt),
            label: 'Pedidos',
            backgroundColor: Colors.amber[600],
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rtl),
            label: 'Concluídos',
            backgroundColor: Colors.green,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle_sharp),
            label: 'entregas',
            backgroundColor: Colors.deepPurpleAccent,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'config',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black45,
        onTap: _onItemTapped,
      ),
    );
  }
}

class entregasEmpresa extends StatefulWidget {
  const entregasEmpresa({Key? key}) : super(key: key);

  @override
  State<entregasEmpresa> createState() => _entregasEmpresaState();
}

class _entregasEmpresaState extends State<entregasEmpresa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              'Fast Travel Delivery - Empresa',
              style: GoogleFonts.macondo(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        body: const empresaEntregas(),
      ),
    );
  }
}

class configsEmpresa extends StatefulWidget {
  const configsEmpresa({Key? key}) : super(key: key);

  @override
  State<configsEmpresa> createState() => _configsEmpresaState();
}

class _configsEmpresaState extends State<configsEmpresa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Center(
            child: Text(
              'Fast Travel Delivery - Empresa',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: const empresaSettings(),
      ),
    );
  }
}
