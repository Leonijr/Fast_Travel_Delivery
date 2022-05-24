import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class empresaSettings extends StatefulWidget {
  const empresaSettings({Key? key}) : super(key: key);

  @override
  State<empresaSettings> createState() => _empresaSettingsState();
}

class _empresaSettingsState extends State<empresaSettings> {
  @override
  Widget build(BuildContext context) {
    return const Text('funcionou settings');
  }
}
