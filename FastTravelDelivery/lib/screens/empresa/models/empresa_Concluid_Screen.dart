import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmpresaConcluid extends StatefulWidget {
  const EmpresaConcluid({Key? key}) : super(key: key);

  @override
  State<EmpresaConcluid> createState() => _EmpresaConcluidState();
}

class _EmpresaConcluidState extends State<EmpresaConcluid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: const Text('funcionou Concluídos'),
    );
  }
}
