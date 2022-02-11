class ClassVotos {
  String? votosUuId;
  String votosNome;
  int votosVotos;
  DateTime? votosCreated;

  ClassVotos({
    this.votosUuId,
    required this.votosNome,
    required this.votosVotos,
    this.votosCreated,
  });

  factory ClassVotos.fromJson(Map<String, dynamic> map) {
    return ClassVotos(
      votosUuId: map['votosUuId'.toString()],
      votosNome: map['votosNome'.toString()],
      votosVotos: map['votosVotos'],
    );
  }

  Map<String, dynamic> toJson() => {
        'votosNome': votosNome,
        'votosVotos': votosVotos,
      };
}
