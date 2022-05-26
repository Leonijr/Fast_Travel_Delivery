import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class clientSettings extends StatefulWidget {
  const clientSettings({Key? key}) : super(key: key);

  @override
  State<clientSettings> createState() => _clientSettingsState();
}

class _clientSettingsState extends State<clientSettings> {
  @override
  Widget build(BuildContext context) {
    return const Text('funcionou settings');
  }
}
