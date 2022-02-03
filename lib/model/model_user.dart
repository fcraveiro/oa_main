class ClassUser {
  String userUuId;
  String userNome;
  String userFoto;

  ClassUser({
    required this.userUuId,
    required this.userNome,
    required this.userFoto,
  });

  factory ClassUser.fromJson(Map<String, dynamic> map) {
    return ClassUser(
      userUuId: map['userUuId'.toString()],
      userNome: map['userNome'.toString()],
      userFoto: map['userFoto'.toString()],
    );
  }

  Map<String, dynamic> toJson() => {
        'userNome': userNome,
        'userFoto': userFoto,
      };
}
