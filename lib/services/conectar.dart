import 'dart:developer';
import 'package:oa_main/model/model_user.dart';
import 'package:supabase/supabase.dart';
import '/services/config.dart';
import '../model/model_pacientes.dart';

class Conecta {
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  // Pacientes

  Future<List<ClassPaciente>> getAll() async {
    log('Leu Pacientes 1');
    final response = await client
        .from('pacientes')
        .select()
        .order('pacNome', ascending: true)
        .execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList.map((map) => ClassPaciente.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future addPaciente(campos) async {
    ClassPaciente pacientes = campos;
    Map<String, dynamic> pacienteJson = pacientes.toJson();
    log(pacienteJson.toString());
    await client
        .from('pacientes')
        .insert(pacienteJson)
        .execute()
        .then((value) => log(value.error.toString()));
  }

  Future updatePaciente(int idPaciente, String cidade) async {
    await client
        .from('pacientes')
        .update({'cidade': cidade})
        .eq('id', idPaciente)
        .execute();
  }

  favoritoPaciente(String pacUuId, bool favorito) async {
//    log(favorito.toString());
    await client
        .from('pacientes')
        .update({'pacFavorito': favorito})
        .eq('pacUuId', pacUuId)
        .execute()
        .then((value) => log('Favorito ok'));
  }

  Future deletePaciente(int idPaciente) async {
    await client.from('pacientes').delete().eq('id', idPaciente).execute();
  }

  Future<List<ClassPaciente>> getAll2() async {
    log('Leu Pacientes 3');
    final response = await client
        .from('pacientes')
        .select()
        .order('pacNome', ascending: true)
        .execute();
    if (response.error == null) {
      log('tem dados');
      final dataList = response.data as List;
      return (dataList.map((map) => ClassPaciente.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future<List<ClassUser>> getUsers() async {
    log('Leu Usuarios');
    final response = await client
        .from('usuarios')
        .select()
        .order('userNome', ascending: true)
        .execute();
    if (response.error == null) {
//      log(response.data.toString());
      final dataList = response.data as List;
      return (dataList.map((map) => ClassUser.fromJson(map)).toList());
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future<List> getAgenda() async {
    log('Leu Agenda 4');
    final response = await client.from('agenda').select().execute();
    if (response.error == null) {
      final dataList = response.data as List;
      return (dataList);
    }
    log('Error fetching notes: ${response.error!.message}');
    return [];
  }

  Future cancelAgenda(String agendaUuId, bool situacao) async {
    await client
        .from('agenda')
        .update({'agendaExcluido': true, 'agendaCancelado': situacao})
        .eq('agendaUuId', agendaUuId)
        .execute()
        .then((value) => log('ok'));
  }

  Future voltaAgenda() async {
    await client
        .from('agenda')
        .update({'agendaExcluido': false, 'agendaCancelado': false})
        .filter('agendaExcluido', 'eq', true)
        .execute()
        .then((value) => log('Volta OK'));
  }
}
