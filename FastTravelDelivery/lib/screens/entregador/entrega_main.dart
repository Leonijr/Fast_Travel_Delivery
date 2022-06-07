import 'package:fasttravel/models/user_local.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Settings_Screen.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Concluid_Screen.dart';
import 'package:fasttravel/screens/entregador/models/veiculo_Entregas_Screen.dart';
import 'package:fasttravel/screens/entregador/models/entrega_Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntregaMainScreen extends StatefulWidget {
  final UserLocal _userLocal;
  const EntregaMainScreen(this._userLocal, {Key? key}) : super(key: key);

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
    veiculoEntregas(),
    entregadorSettings(),
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
            label: 'Veículo',
            backgroundColor: Colors.deepPurpleAccent,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
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
