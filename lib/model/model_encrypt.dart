class ClassEncrypt {
  String? encUuId;
  String encNome;
  String encNome2;
  int encFone;
  int encFone2;
  DateTime? encCreated;

  ClassEncrypt({
    this.encUuId,
    required this.encNome,
    required this.encNome2,
    required this.encFone,
    required this.encFone2,
    this.encCreated,
  });

  factory ClassEncrypt.fromJson(Map<String, dynamic> map) {
    return ClassEncrypt(
      encUuId: map['encUuId'.toString()],
      encNome: map['encNome'.toString()],
      encNome2: map['encNome2'.toString()],
      encFone: map['encFone'],
      encFone2: map['encFone2'],
    );
  }

  Map<String, dynamic> toJson() => {
        'encNome': encNome,
        'encNome2': encNome2,
        'encFone': encFone,
        'encFone2': encFone2,
      };
}
