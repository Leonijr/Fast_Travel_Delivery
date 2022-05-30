class Entregador {
  late final String id;
  late final String name;
  late final String email;
  late final String cpf;
  late final String veiculo;
  late final String password;
  late final String confirmPassword;

/* método construtor utilizado para inicializar o estado do objeto e também
disparar algum processo necessário quanto a instanciação da classe */
  Entregador(
    this.name,
    this.email,
    this.cpf,
    this.veiculo,
    this.password,
    this.confirmPassword,
  );

  /* Método para converter objetos em formato MAP em obj academic */
  Entregador.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        cpf = map['cpf'],
        veiculo = map['veiculo'],
        password = map['password'],
        confirmPassword = map['confirmPassword'];

  // método para conversão para MAP

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'veiculo': veiculo,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
