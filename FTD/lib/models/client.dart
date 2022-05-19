class Client {
  late final String? id;
  late final String? name;
  late final String? email;
  late final String? endereco;
  late final String? password;
  late final String? confirmPass;
  final String type = 'Cliente';

/* método construtor utilizado para inicializar o estado do objeto e também
disparar algum processo necessário quanto a instanciação da classe */
  Client(
    this.name,
    this.email,
    this.endereco,
    this.password,
    this.confirmPass,
  );

  /* Método para converter objetos em formato MAP em obj academic */
  Client.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        endereco = map['endereco'],
        password = map['password'],
        confirmPass = map['confirmPass'];

  // método para conversão para MAP

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'endereco': endereco,
      'password': password,
      'confirmPass': confirmPass,
      'type': type
    };
  }
}
