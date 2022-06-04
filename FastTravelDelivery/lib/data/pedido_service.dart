import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:flutter/foundation.dart';
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

  Stream<QuerySnapshot> statusEmpresa() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'preparando')
        .snapshots();
    return colecao;
  }

  Stream<QuerySnapshot> statusEntrega() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'pronto p/ entrega')
        .snapshots();
    return colecao;
  }

  Stream<QuerySnapshot> statusACaminho() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'Rota de Entrega')
        .snapshots();
    return colecao;
  }

  Stream<QuerySnapshot> statusConcluido() {
    colecao = _firestore
        .collection('Pedidos')
        .where('status', isEqualTo: 'Concluido')
        .snapshots();
    return colecao;
  }

  Future<void> updateStts(item) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('Pedidos');

    var coll = await ref.doc(item).update({'status': 'pronto p/ entrega'});
    return coll;
  }

  Future<void> updateSttsEntrega(item) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('Pedidos');

    var coll = await ref.doc(item).update({'status': 'Rota de Entrega'});
    return coll;
  }

  Future<void> updateSttsConcluido(item) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('Pedidos');

    var coll = await ref.doc(item).update({'status': 'Concluido'});
    return coll;
  }
}
