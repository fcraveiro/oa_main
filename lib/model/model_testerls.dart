class ClassTesteRls {
  String? tes2UuId;
  String tes2Nome;
  String tes2Text1;
  bool tes2Bool1;
  int tes2Int1;
  DateTime? tes2created;

  ClassTesteRls({
    this.tes2UuId,
    required this.tes2Nome,
    required this.tes2Text1,
    required this.tes2Bool1,
    required this.tes2Int1,
    this.tes2created,
  });

  factory ClassTesteRls.fromJson(Map<String, dynamic> map) {
    return ClassTesteRls(
      tes2UuId: map['tes2UuId'.toString()],
      tes2Nome: map['tes2Nome'.toString()],
      tes2Text1: map['tes2Text1'.toString()],
      tes2Bool1: map['tes2Bool1'],
      tes2Int1: map['tes2Int1'],
//      tes2created: map['tes2created'],
//      tes2created: map[DateTime.fromMillisecondsSinceEpoch(map['tes2created'])],
//      tesHora: map['tesHora'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tes2Nome': tes2Nome,
        'tes2Text1': tes2Text1,
        'tes2Bool1': tes2Bool1,
        'tes2Int1': tes2Int1,
      };
}
