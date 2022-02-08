class ClassTeste {
  String? tesUuId;
  String tesText1;
  String tesText2;
  int tesInt1;
  bool tesBool1;
  DateTime? tesHora;

  ClassTeste({
    required this.tesUuId,
    required this.tesText1,
    required this.tesText2,
    required this.tesInt1,
    required this.tesBool1,
    this.tesHora,
  });

  factory ClassTeste.fromJson(Map<String, dynamic> map) {
    return ClassTeste(
      tesUuId: map['tesUuId'.toString()],
      tesText1: map['tesText1'.toString()],
      tesText2: map['tesText2'.toString()],
      tesInt1: map['tesInt1'],
      tesBool1: map['tesBool1'],
//      tesHora: map[DateTime.fromMillisecondsSinceEpoch(map['tesHora'])],
//      tesHora: map['tesHora'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tesText1': tesText1,
        'tesText2': tesText2,
        'tesInt1': tesInt1,
        'tesBool1': tesBool1,
      };
}
