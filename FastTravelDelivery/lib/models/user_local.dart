import 'package:cloud_firestore/cloud_firestore.dart';

class UserLocal {
  String? id;
  String? email;
  String? password;

  UserLocal({
    this.id,
    required this.email,
    required this.password,
  });

//metodo para converter algum objeto para a estrutura de dados compativel com a estrutura do firebase
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

//metodo para converter formato json para objeto (desserializando o Map)
  factory UserLocal.fromMap(Map<String, dynamic> map) {
    return UserLocal(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }

  UserLocal.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    email = doc.get('email') as String;
  }
}
