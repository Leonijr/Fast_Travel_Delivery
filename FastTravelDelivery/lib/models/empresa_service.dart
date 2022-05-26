import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasttravel/models/empresa.dart';
import 'package:flutter/material.dart';

class EmpresaService {
  // obter instancia do Firebase localmente
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //métdo para gravar dados no FireBase
  add(Empresa empresa) {
    _firestore.collection("FastTravel").add(
          empresa.toMap(),
          /* toMap faz a conversão dos objetos
        em um Map ser persistido no Firebase, enviado os dados em formato Json*/
        );
  }
}
