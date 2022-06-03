import 'package:cloud_firestore/cloud_firestore.dart';

class formEntregaStatus {
  late final String? id;
  late final String? name;
  late final String? local;
  late final String? status;

  formEntregaStatus(
    this.name,
    this.local,
    this.status,
  );

  formEntregaStatus.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        local = map['local'],
        status = map['status'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'local': local,
      'status': status,
    };
  }

  formEntregaStatus.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    local = document['local'] as String;
    status = document['status'] as String;
  }
}
