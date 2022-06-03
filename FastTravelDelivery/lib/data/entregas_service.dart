import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/data/formEntregaStatus.dart';
import 'package:fasttravel/data/formPedidoStatus.dart';
import 'package:flutter/material.dart';

class EntregaService {
  // obter instancia do Firebase localmente
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var colecao;
  //métdo para gravar dados no FireBase
  add(formEntregaStatus sttsEntrega) {
    _firestore.collection("Entregas").add(
          sttsEntrega.toMap(),
          /* toMap faz a conversão dos objetos
        em um Map ser persistido no Firebase, enviado os dados em formato Json*/
        );
  }

  Stream<QuerySnapshot> getDeliveryList() {
    //listar dados do FIREBASE
    CollectionReference deliveryRef = _firestore.collection("Entregas");
    return deliveryRef.snapshots();
  }

  Future<String> getDeliveryByStatus(String status) async {
    var collection = _firestore.collection("Entregas");
    var docSnapshot = await collection.doc(status).get();
    Map<String, dynamic>? data = docSnapshot.data();
    return Future.value(data!['Entregas']);
  }

  Stream<QuerySnapshot> statusEntrega() {
    colecao = _firestore
        .collection('Entregas')
        .where('status', isEqualTo: 'pronto p/ retirar')
        .snapshots();
    return colecao;
  }
}
