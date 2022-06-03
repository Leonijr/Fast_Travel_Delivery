class formPedidoStatus {
  late final String? id;
  late final String? name;
  late final String? pedido;
  late final String? local;
  late final String? status;

  formPedidoStatus(this.name, this.pedido, this.local, this.status);

  formPedidoStatus.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        pedido = map['pedido'],
        local = map['local'],
        status = map['status'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pedido': pedido,
      'local': local,
      'status': status,
    };
  }
}
