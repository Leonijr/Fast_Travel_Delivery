import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class empresaEntregas extends StatefulWidget {
  const empresaEntregas({Key? key}) : super(key: key);

  @override
  State<empresaEntregas> createState() => _empresaEntregasState();
}

class _empresaEntregasState extends State<empresaEntregas> {
  @override
  Widget build(BuildContext context) {
    return const Text('funcionou entregas');
  }
}
