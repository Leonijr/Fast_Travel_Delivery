class UserLocal {
  String id;
  String email;
  String password;

  UserLocal({
    required this.id,
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
}
