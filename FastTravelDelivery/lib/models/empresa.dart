class Empresa {
  late final String name;
  late final String email;
  late final String cnpj;
  late final String endereco;
  late final String password;
  late final String confirmPassword;

/* método construtor utilizado para inicializar o estado do objeto e também
disparar algum processo necessário quanto a instanciação da classe */
  Empresa(
    this.name,
    this.email,
    this.cnpj,
    this.endereco,
    this.password,
    this.confirmPassword,
  );

  /* Método para converter objetos em formato MAP em obj academic */
  Empresa.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        cnpj = map['cnpj'],
        endereco = map['endereco'],
        password = map['password'],
        confirmPassword = map['confirmPassword'];

  // método para conversão para MAP

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cnpj': cnpj,
      'endereco': endereco,
      'password': password,
      'ConfirmPassword': confirmPassword,
    };
  }
}
