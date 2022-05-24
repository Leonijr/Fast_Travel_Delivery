import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/models/client.dart';
import 'package:flutter/material.dart';

class ClienteService {
  // obter instancia do Firebase localmente
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //métdo para gravar dados no FireBase
  add(Client client) {
    _firestore.collection("FastTravel").add(
          client.toMap(),
          /* toMap faz a conversão dos objetos
        em um Map ser persistido no Firebase, enviado os dados em formato Json*/
        );
  }

  //criar método para obter dados do FIREBASE

  //Devemos definir o tipo de retorno de acordo com quem irá receber o resultado
  Stream<QuerySnapshot> getClientList() {
    //definimos que tipo de dados pode conter a listagem vindo do firebase
    CollectionReference clientCollection = _firestore.collection('FastTravel');
    return clientCollection.snapshots();
  }
}
