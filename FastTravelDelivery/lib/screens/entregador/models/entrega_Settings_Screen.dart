import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class entregadorSettings extends StatefulWidget {
  const entregadorSettings({Key? key}) : super(key: key);

  @override
  State<entregadorSettings> createState() => _entregadorSettingsState();
}

class _entregadorSettingsState extends State<entregadorSettings> {
  @override
  Widget build(BuildContext context) {
    return const Text('funcionou settings da entrega');
  }
}
