import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EntregaConcluid extends StatefulWidget {
  const EntregaConcluid({Key? key}) : super(key: key);

  @override
  State<EntregaConcluid> createState() => _EntregaConcluidState();
}

class _EntregaConcluidState extends State<EntregaConcluid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: const Text('funcionou Concluídos do entregador'),
    );
  }
}
