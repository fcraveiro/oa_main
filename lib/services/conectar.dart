import 'dart:developer';
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
}
