import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:fasttravel/data/pedido_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class clientConcluid extends StatefulWidget {
  const clientConcluid({Key? key}) : super(key: key);

  @override
  State<clientConcluid> createState() => _clientConcluidState();
}

class _clientConcluidState extends State<clientConcluid> {
  PedidoService _pedidoService = new PedidoService();
  bool icone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Fast Travel Delivery ',
            style: GoogleFonts.macondo(
              color: Colors.amber[600],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 500,
          height: 400,
          child: Center(
            child: Card(
              color: Colors.blueGrey[400],
              elevation: 8.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: _pedidoService.statusConcluido(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> docuSnap = snapshot.data!.docs;
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: docuSnap.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = formPedidoStatus(
                            docuSnap[index].id,
                            docuSnap[index].get('name'),
                            docuSnap[index].get('pedido'),
                            docuSnap[index].get('local'),
                            docuSnap[index].get('status'));
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    docuSnap[index].get('name'),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    docuSnap[index].get('pedido'),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  width: 15,
                                ),
                                Expanded(
                                  child: Text(
                                    docuSnap[index].get('local'),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                  width: 15,
                                ),
                                IconButton(
                                  onPressed: () {
                                    _pedidoService.updateStts(item.id);
                                    final snackBar = SnackBar(
                                      content: const Text(
                                          'Pedido de entrega solicitado com sucesso'),
                                      action: SnackBarAction(
                                        label: 'Ok',
                                        onPressed: () {
                                          debugPrint(
                                              docuSnap[index].get('status'));
                                          icone = true;
                                          if (icone = true) {
                                            debugPrint('$icone');
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                backgroundColor:
                                                    Colors.amber[600],
                                                title: const Text('Atenção: '),
                                                content: const Text(
                                                    'Aguardando entregador aceitar o pedido'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context,
                                                            'Cancelar'),
                                                    child:
                                                        const Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  icon: const Icon(Icons.send,
                                      color: Colors.greenAccent, size: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(
                        height: 30,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Text('Não há pedidos');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
