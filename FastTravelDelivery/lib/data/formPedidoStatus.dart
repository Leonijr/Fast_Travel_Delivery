class formPedidoStatus {
  late final String? id;
  late final String? name;
  late final String? pedido;
  late final String? local;

  formPedidoStatus(
    this.name,
    this.pedido,
    this.local,
  );

  formPedidoStatus.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        pedido = map['pedido'],
        local = map['local'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pedido': pedido,
      'local': local,
    };
  }
}
