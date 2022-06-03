import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:flutter/material.dart';

class PedidoService {
  // obter instancia do Firebase localmente
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var colecao;

  //métdo para gravar dados no FireBase
  add(formPedidoStatus sttsPedido) {
    _firestore.collection("Pedidos").add(
          sttsPedido.toMap(),
          /* toMap faz a conversão dos objetos
        em um Map ser persistido no Firebase, enviado os dados em formato Json*/
        );
  }

  Stream<QuerySnapshot> getWishList() {
    //listar dados do FIREBASE
    CollectionReference WishRef = _firestore.collection("Pedidos");
    return WishRef.snapshots();
  }

  Stream<QuerySnapshot> statusEntrega() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'pronto p/ retirar')
        .snapshots();
    return colecao;
  }

  Stream<QuerySnapshot> statusEmpresa() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'preparando')
        .snapshots();
    return colecao;
  }

  Future<void> alteraStts() async {
    CollectionReference ref = _firestore.collection('Pedidos');
    String? docs;
    statusEntrega().asyncMap((event) => docs = ref.id);
    colecao = ref.doc(docs).update({'status': 'pronto p/ retirar'});
  }
}
