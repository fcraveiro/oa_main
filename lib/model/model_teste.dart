class ClassTeste {
  String? tesUuId;
  String tesText1;
  String tesText2;
  String tesText3;
  int tesInt1;
  int tesInt2;
  int tesInt3;
  bool tesBool1;
  bool tesBool2;
  bool tesBool3;

  ClassTeste({
    required this.tesUuId,
    required this.tesText1,
    required this.tesText2,
    required this.tesText3,
    required this.tesInt1,
    required this.tesInt2,
    required this.tesInt3,
    required this.tesBool1,
    required this.tesBool2,
    required this.tesBool3,
  });

  factory ClassTeste.fromJson(Map<String, dynamic> map) {
    return ClassTeste(
      tesUuId: map['tesUuId'.toString()],
      tesText1: map['tesText1'.toString()],
      tesText2: map['tesText2'.toString()],
      tesText3: map['tesText3'.toString()],
      tesInt1: map['tesInt1'],
      tesInt2: map['tesInt2'],
      tesInt3: map['tesInt3'],
      tesBool1: map['tesBool1'],
      tesBool2: map['tesBool2'],
      tesBool3: map['tesBool3'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tesText1': tesText1,
        'tesText2': tesText1,
        'tesText3': tesText1,
        'tesInt1': tesInt1,
        'tesInt2': tesInt1,
        'tesInt3': tesInt1,
        'tesBool1': tesBool1,
        'tesBool2': tesBool1,
        'tesBool3': tesBool1,
      };
}
