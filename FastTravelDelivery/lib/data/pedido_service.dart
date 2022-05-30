import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:flutter/material.dart';

class PedidoService {
  // obter instancia do Firebase localmente
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<String> getWishById(String id) async {
    var collection = _firestore.collection("Pedidos");
    var docSnapshot = await collection.doc(id).get();
    Map<String, dynamic>? data = docSnapshot.data();
    return Future.value(data!['pedido']);
  }
}
