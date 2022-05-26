import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class clientConcluid extends StatefulWidget {
  const clientConcluid({Key? key}) : super(key: key);

  @override
  State<clientConcluid> createState() => _clientConcluidState();
}

class _clientConcluidState extends State<clientConcluid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: const Text('funcionou Concluídos'),
    );
  }
}
