import 'package:fasttravel/screens/entregador/models/entrega_Settings_Screen.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Concluid_Screen.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Entregas_Screen.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntregaMainScreen extends StatefulWidget {
  const EntregaMainScreen({Key? key}) : super(key: key);

  @override
  State<EntregaMainScreen> createState() => _EntregaMainScreenState();
}

class _EntregaMainScreenState extends State<EntregaMainScreen> {
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
    entregaHome(),
    concluidosEntrega(),
    entregasEntregador(),
    configsEntrega(),
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
            backgroundColor: Colors.yellowAccent[700],
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

class concluidosEntrega extends StatefulWidget {
  const concluidosEntrega({Key? key}) : super(key: key);

  @override
  State<concluidosEntrega> createState() => _concluidosEntregaState();
}

class _concluidosEntregaState extends State<concluidosEntrega> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              'Fast Travel Delivery - Entregador',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: const Center(child: EntregaConcluid()),
      ),
    );
  }
}

class entregasEntregador extends StatefulWidget {
  const entregasEntregador({Key? key}) : super(key: key);

  @override
  State<entregasEntregador> createState() => _entregasEntregadorState();
}

class _entregasEntregadorState extends State<entregasEntregador> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              'Fast Travel Delivery - Entregador',
              style: GoogleFonts.macondo(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        body: const entregadorEntregas(),
      ),
    );
  }
}

class configsEntrega extends StatefulWidget {
  const configsEntrega({Key? key}) : super(key: key);

  @override
  State<configsEntrega> createState() => _configsEntregaState();
}

class _configsEntregaState extends State<configsEntrega> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: Center(
            child: Text(
              'Fast Travel Delivery - Entregador',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: const entregadorSettings(),
      ),
    );
  }
}
