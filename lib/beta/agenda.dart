import 'dart:developer';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:oa_main/model/model_agenda.dart';
import 'package:oa_main/services/conectar.dart';
import 'package:supabase/supabase.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '/services/config.cfg';

class AgendaPacientes extends StatefulWidget {
  const AgendaPacientes({Key? key}) : super(key: key);

  @override
  _AgendaPacientesState createState() => _AgendaPacientesState();
}

class _AgendaPacientesState extends State<AgendaPacientes> {
  Conecta conectar = Conecta();
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  late final ValueNotifier<List<Eventos>> _selectedEvents;
  late Map<DateTime, List<Eventos>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

//  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
    gerarEvento();
    Future.delayed(const Duration(milliseconds: 1000), () {});
//    DateTime bizungaDay = DateTime.now();
//    DateTime campo = DateTime.utc(bizungaDay.year, bizungaDay.month,
//        bizungaDay.day, bizungaDay.hour, bizungaDay.minute, bizungaDay.second);
//    var testtt = _getEventsfromDay(campo);
//    log(testtt.toString());
//    log(campo.toString());
//    List<Eventos> seleciona = _getEventsfromDay(campo);
    _selectedEvents = ValueNotifier(_getEventsfromDay(selectedDay));

//    _selectedEvents.value = _getEventsfromDay(selectedDay);

    setState(() {
      _selectedEvents.value = _getEventsfromDay(selectedDay);
    });
  }

  List<Eventos> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  gerarEvento() async {
    final response = await client
        .from('agenda')
        .select()
        .filter('agendaExcluido', 'eq', false)
        .execute();
    if (response.error == null) {
      log('LEU');

      final dataList = response.data as List;
      for (var i = 0; i < dataList.length; i++) {
        var evento = (Eventos.fromJson(dataList[i]));
        DateTime campo = DateTime.utc(
            evento.agendaData.year,
            evento.agendaData.month,
            evento.agendaData.day,
            evento.agendaData.hour,
            evento.agendaData.minute,
            evento.agendaData.second);
        if (selectedEvents[campo] != null) {
          selectedEvents[campo]!.add(
            Eventos(
              agendaData: campo,
              agendaUuId: evento.agendaUuId,
              agendaTitulo: evento.agendaTitulo,
              agendaDesc: evento.agendaDesc,
              agendaPac: evento.agendaPac,
              agendaNome: evento.agendaNome,
//              agendaHora: evento.agendaHora,
              agendaCancelado: evento.agendaCancelado,
              agendaRemarcado: evento.agendaRemarcado,
              agendaExcluido: evento.agendaExcluido,
              agendaTratado: evento.agendaTratado,
            ),
          );
        } else {
          selectedEvents[campo] = [
            Eventos(
              agendaData: campo,
              agendaTitulo: evento.agendaTitulo,
              agendaUuId: evento.agendaUuId,
              agendaDesc: evento.agendaDesc,
              agendaPac: evento.agendaPac,
              agendaNome: evento.agendaNome,
//              agendaHora: evento.agendaHora,
              agendaCancelado: evento.agendaCancelado,
              agendaExcluido: evento.agendaExcluido,
              agendaRemarcado: evento.agendaRemarcado,
              agendaTratado: evento.agendaTratado,
            )
          ];
        }
        log(selectedEvents[campo].toString());
      }
    }
    refazLista();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  void dispose() {
//    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Pacientes'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
        actions: [
          IconButton(
            onPressed: () => {
              refaz2(),
            },
            icon: const FaIcon(
              FontAwesomeIcons.redo,
              size: 16,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              key: const ValueKey(1),
              locale: 'pt_BR',
              availableCalendarFormats: const {
                CalendarFormat.month: 'Mês',
                CalendarFormat.twoWeeks: '2 Semanas',
                CalendarFormat.week: 'Semana',
              },
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                  log('Day 1 ${selectDay.toString()}');
                  log('Day 2 ${selectedDay.toString()}');
                  log('Day 3 ${focusDay.toString()}');
                  log('Day 4 ${focusedDay.toString()}');
                  _selectedEvents.value = _getEventsfromDay(selectedDay);
                });
                // ignore: avoid_print
                print(focusedDay);
              },

              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                selectedTextStyle: const TextStyle(color: Colors.black),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
//                  color: Colors.grey.shade300,
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              height: 1,
              color: Color(0xFFBDBDBD),
            ),
            Expanded(
              child: ValueListenableBuilder<List<Eventos>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        color: Colors.amber,
                        margin: const EdgeInsets.only(
                          top: 6,
                          left: 10,
                          right: 10,
                        ),
                        child: Slidable(
                          groupTag: '1',
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  remarcarAgenda(
                                      context, value[index].agendaUuId);
                                  setState(() {});
                                },
                                backgroundColor: const Color(0xFF7BC043),
                                foregroundColor: Colors.white,
                                icon: Icons.calendar_today_rounded,
                                label: 'Remarcar',
                              ),
                              SlidableAction(
                                onPressed: (context) async {
                                  await apagarAgenda(
                                      context, value[index].agendaUuId);
                                  setState(() {
                                    selectedEvents.clear();
                                    gerarEvento();
                                    const Scaffold();
                                  });
                                },
                                backgroundColor: const Color(0xFF0392CF),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Apagar',
                              ),
                            ],
                          ),
                          child: exibe(value, index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  exibe(value, index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
//                                  margin: const EdgeInsets.only(right: 10),
      color: const Color(0xFFD6D6D6),
      child: ListTile(
        dense: true,
        onTap: () => {
          //      selectedEvents = {},
          //      gerarEvento(),
          log(
            value[index].agendaNome,
          ),
        },
        title: Text(
          value[index].agendaNome,
          style: const TextStyle(
            fontSize: 16,
            //                                        color: Colors.blue.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          value[index].agendaTitulo,
        ),
        leading: Container(
          height: 40,
          width: 50,
          margin: const EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DateFormat("dd/MM").format(value[index].agendaData),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  refazLista() {
    setState(() {
//      selectedEvents.clear();
//      gerarEvento();
      // ignore: unnecessary_statements
      selectedEvents[selectedDay];
      _selectedEvents.value = _getEventsfromDay(selectedDay);
      log('SetState');
    });
  }

  refaz2() async {
    await conectar.voltaAgenda();
    selectedEvents.clear();
    await gerarEvento();
    refazLista();
  }
}

apagarAgenda(BuildContext context, uuid) async {
  Conecta conectar = Conecta();
  final response = await conectar.cancelAgenda(uuid, true);
  log('Apagar : $uuid');
  log('Feito $response');
}

remarcarAgenda(BuildContext context, uuid) {
  log('Remarcar : $uuid');
}


/*
                displacement: 250,
                backgroundColor: Colors.yellow,
                color: Colors.red,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  setState(() {
                    selectedEvents = {};
                    gerarEvento();
                    _selectedEvents =
                        ValueNotifier(_getEventsfromDay(selectedDay));
                    _selectedEvents.value = _getEventsfromDay(selectedDay);

                    log('passou aqui');
                  });
                },
                */