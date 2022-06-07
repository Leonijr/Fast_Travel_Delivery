import 'package:fasttravel/screens/cliente/client_Screen.dart';
import 'package:fasttravel/screens/cliente/models/client_Settings_Screen.dart';
import 'package:fasttravel/screens/cliente/models/client_concluid_Screen.dart';
import 'package:fasttravel/screens/cliente/models/client_entrega_Screen.dart';
import 'package:fasttravel/screens/cliente/models/client_home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClienteMainScreen extends StatefulWidget {
  const ClienteMainScreen({Key? key}) : super(key: key);

  @override
  State<ClienteMainScreen> createState() => _ClienteMainScreenState();
}

class _ClienteMainScreenState extends State<ClienteMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    clientHome(),
    clientConcluid(),
    clientEntregas(),
    configsClient(),
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

class configsClient extends StatefulWidget {
  const configsClient({Key? key}) : super(key: key);

  @override
  State<configsClient> createState() => _configsClientState();
}

class _configsClientState extends State<configsClient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Center(
            child: Text(
              'Fast Travel Delivery',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: const clientSettings(),
      ),
    );
  }
}
