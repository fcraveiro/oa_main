class ClassPaciente {
  String pacUuId;
  int pacDentista;
  String pacNome;
  String pacEnde;
  String pacCity;
  String pacEst;
  int pacCep;
  int pacFone;
  int pacCel;
  bool pacZap1;
  bool pacZap2;
  bool pacFavorito;
  bool pacTratando;
  bool pacRemarcado;
  bool pacCompleto;
  bool pacAviso1;
  bool pacAviso2;
  bool pacAviso3;
  bool pacAviso4;
  bool pacAviso5;
  bool pacAviso6;

  ClassPaciente({
    required this.pacUuId,
    required this.pacDentista,
    required this.pacNome,
    required this.pacEnde,
    required this.pacCity,
    required this.pacEst,
    required this.pacCep,
    required this.pacFone,
    required this.pacCel,
    required this.pacZap1,
    required this.pacZap2,
    required this.pacFavorito,
    required this.pacTratando,
    required this.pacRemarcado,
    required this.pacCompleto,
    required this.pacAviso1,
    required this.pacAviso2,
    required this.pacAviso3,
    required this.pacAviso4,
    required this.pacAviso5,
    required this.pacAviso6,
  });

  factory ClassPaciente.fromJson(Map<String, dynamic> map) {
    return ClassPaciente(
        pacUuId: map['pacUuId'.toString()],
        pacNome: map['pacNome'.toString()],
        pacEnde: map['pacEnde'.toString()],
        pacCity: map['pacCity'.toString()],
        pacEst: map['pacEst'.toString()],
        pacCep: map['pacCep'],
        pacFone: map['pacFone'],
        pacCel: map['pacCel'],
        pacZap1: map['pacZap1'],
        pacZap2: map['pacZap2'],
        pacFavorito: map['pacFavorito'],
        pacTratando: map['pacTratando'],
        pacRemarcado: map['pacRemarcado'],
        pacDentista: map['pacDentista'],
        pacCompleto: map['pacCompleto'],
        pacAviso1: map['pacAviso1'],
        pacAviso2: map['pacAviso2'],
        pacAviso3: map['pacAviso3'],
        pacAviso4: map['pacAviso4'],
        pacAviso5: map['pacAviso5'],
        pacAviso6: map['pacAviso6']);
  }

  Map<String, dynamic> toJson() => {
        'pacDentista': pacDentista,
        'pacNome': pacNome,
        'pacEnde': pacEnde,
        'pacCity': pacCity,
        'pacEst': pacEst,
        'pacCep': pacCep,
        'pacFone': pacFone,
        'pacCel': pacCel,
        'pacZap1': pacZap1,
        'pacZap2': pacZap2,
        'pacFavorito': pacFavorito,
        'pacTratando': pacTratando,
        'pacRemarcado': pacRemarcado,
        'pacCompleto': pacCompleto,
        'pacAviso1': pacAviso1,
        'pacAviso2': pacAviso2,
        'pacAviso3': pacAviso3,
        'pacAviso4': pacAviso4,
        'pacAviso5': pacAviso5,
        'pacAviso6': pacAviso6,
      };
}
