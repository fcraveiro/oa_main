import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:oa_main/services/conectar.dart';
import 'pacientes.dart';

Conecta conectar = Conecta();

pesqNome(value) {
  pesquisandoFavorito = false;
  filteredPacientes = lista
      .where((n) => n.pacNome.toLowerCase().contains(value.toLowerCase()))
      .toList();
}

limpaPesquisa() {
  filteredPacientes = [];
  pesquisandoFavorito = false;
  corEscolha1 = const Color(0xFF48426D);
  corEscolha2 = const Color(0xFF48426D);
  corEscolha3 = const Color(0xFF48426D);
}

mostraTodos() {
  pesquisandoFavorito = false;
  filteredPacientes = lista;
  selecionados = filteredPacientes.length;
}

pesqFavorito() {
  limpaPesquisa();
  pesquisandoFavorito = true;
  corEscolha1 = const Color(0xFF373258);
  filteredPacientes = lista.where((n) => n.pacFavorito == true).toList();
  selecionados = filteredPacientes.length;
  filteredPacientes;
}

pesqTratando() {
  limpaPesquisa();
  pesquisandoFavorito = false;
  corEscolha2 = const Color(0xFF373258);
  filteredPacientes = lista.where((n) => n.pacTratando == true).toList();
  selecionados = filteredPacientes.length;
  filteredPacientes;
}

pesqRemarcado() {
  limpaPesquisa();
  pesquisandoFavorito = false;
  corEscolha3 = const Color(0xFF373258);
  filteredPacientes = lista.where((n) => n.pacRemarcado == true).toList();
  selecionados = filteredPacientes.length;
  filteredPacientes;
}

mudaFavorito(index) {
  filteredPacientes[index].pacFavorito = !filteredPacientes[index].pacFavorito;
  bool favorito = filteredPacientes[index].pacFavorito;
  String uuid = filteredPacientes[index].pacUuId;
  conectar.favoritoPaciente(uuid, favorito);
}

mudaTela(lista, int index) {
  log('Vai pra Paciente');
  log(filteredPacientes[index].pacNome);
}
