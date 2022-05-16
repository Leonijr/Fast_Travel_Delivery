import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/models/client.dart';
import 'package:fasttravel/models/entregador.dart';
import 'package:flutter/material.dart';

class EntregadorService {
  // obter instancia do Firebase localmente
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //métdo para gravar dados no FireBase
  add(Entregador entregador) {
    _firestore.collection("FastTravel").add(
          entregador.toMap(),
          /* toMap faz a conversão dos objetos
        em um Map ser persistido no Firebase, enviado os dados em formato Json*/
        );
  }
}
