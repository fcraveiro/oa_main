class Eventos {
  final String agendaUuId;
  final int agendaPac;
  final String agendaNome;
  final String agendaTitulo;
  final String agendaDesc;
  final DateTime agendaData;
//  final String agendaHora;
  final bool agendaCancelado;
  final bool agendaTratado;
  final bool agendaExcluido;
  final bool agendaRemarcado;

  Eventos({
    required this.agendaUuId,
    required this.agendaPac,
    required this.agendaNome,
    required this.agendaTitulo,
    required this.agendaDesc,
    required this.agendaData,
//    required this.agendaHora,
    required this.agendaCancelado,
    required this.agendaExcluido,
    required this.agendaTratado,
    required this.agendaRemarcado,
  });

  factory Eventos.fromJson(Map<String, dynamic> json) => Eventos(
        agendaUuId: json['agendaUuId'].toString(),
        agendaPac: json['agendaPac'],
        agendaNome: json['agendaNome'],
        agendaTitulo: json['agendaTitulo'].toString(),
        agendaDesc: json['agendaDesc'].toString(),
        agendaData: DateTime.parse(json["agendaData"]),
//        agendaHora: json["agendaHora"].toString(),
        agendaCancelado: json["agendaCancelado"],
        agendaTratado: json["agendaTratado"],
        agendaRemarcado: json["agendaRemarcado"],
        agendaExcluido: json["agendaExcluido"],
      );

  Map<String, dynamic> toJson() => {
        "agendaUuId": agendaUuId,
        "agendaPac": agendaPac,
        "agendaNome": agendaNome,
        "agendaTitulo": agendaTitulo,
        "agendaDesc": agendaDesc,
        "agendaData": agendaData,
//        "agendaHora": agendaHora,
        "agendaCancelado": agendaCancelado,
        "agendaTratado": agendaTratado,
        "agendaExcluido": agendaExcluido,
        "agendaRemarcado": agendaRemarcado,
      };

  factory Eventos.fromMap(Map data) {
    return Eventos(
      agendaUuId: data['agendaUuId'],
      agendaPac: data['agendaPac'],
      agendaNome: data['agendaNome'],
      agendaTitulo: data['agendaTitulo'],
      agendaDesc: data['agendaDesc'],
      agendaData: data['agendaData'],
//      agendaHora: data['agendaHora'],
      agendaCancelado: data['agendaCancelado'],
      agendaRemarcado: data['agendaRemarcado'],
      agendaExcluido: data['agendaExcluido'],
      agendaTratado: data['agendaTratado'],
    );
  }
}
