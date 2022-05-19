import 'package:fasttravel/screens/client_Screen.dart';
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
    homeClient(),
    concluidosClient(),
    entregasClient(),
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

class homeClient extends StatefulWidget {
  const homeClient({Key? key}) : super(key: key);

  @override
  State<homeClient> createState() => _homeClientState();
}

class _homeClientState extends State<homeClient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: Center(
            child: Text(
              'Fast Travel Delivery',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const clientHome(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FloatingActionButton(
                        child: const Icon(Icons.add), onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class concluidosClient extends StatefulWidget {
  const concluidosClient({Key? key}) : super(key: key);

  @override
  State<concluidosClient> createState() => _concluidosClientState();
}

class _concluidosClientState extends State<concluidosClient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              'Fast Travel Delivery',
              style: GoogleFonts.macondo(
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
        body: const clientConcluid(),
      ),
    );
  }
}

class entregasClient extends StatefulWidget {
  const entregasClient({Key? key}) : super(key: key);

  @override
  State<entregasClient> createState() => _entregasClientState();
}

class _entregasClientState extends State<entregasClient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              'Fast Travel Delivery',
              style: GoogleFonts.macondo(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        body: const clientEntregas(),
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
