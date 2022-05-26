import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class entregadorEntregas extends StatefulWidget {
  const entregadorEntregas({Key? key}) : super(key: key);

  @override
  State<entregadorEntregas> createState() => _entregadorEntregasState();
}

class _entregadorEntregasState extends State<entregadorEntregas> {
  @override
  Widget build(BuildContext context) {
    return const Text('funcionou entregas do entregador');
  }
}
