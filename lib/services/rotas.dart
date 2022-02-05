import 'package:get/get.dart';
import 'package:oa_main/paginas/inicio.dart';
import 'package:oa_main/menu.dart';
import 'package:oa_main/paginas/pacientes/addpaciente.dart';
import 'package:oa_main/paginas/pacientes/gravapacientes.dart';
import 'package:oa_main/paginas/pacientes/paciente.dart';
import 'package:oa_main/paginas/pacientes/pacientes.dart';

import '../beta/agenda.dart';
import '../beta/foto.dart';
import '../beta/fotos2.dart';
import '../beta/grid.dart';
import '../beta/picker.dart';
import '../beta/pickernovo.dart';
import '../beta/pin.dart';
import '../beta/setup.dart';

rotas() {
  return [
    GetPage(name: '/', page: () => const Inicio()),
    GetPage(
        name: '/inicio',
        page: () => const Inicio(),
        transition: Transition.zoom),
    GetPage(
        name: '/menu/', page: () => const Menu(), transition: Transition.zoom),
    GetPage(
        name: '/pacientes/',
        page: () => const Pacientes(),
        transition: Transition.zoom),
    GetPage(
        name: '/paciente/',
        page: () => Paciente(
              filteredPacientes: filteredPacientes,
              indexa: indexa,
            ),
        transition: Transition.zoom),
    GetPage(
        name: '/addpaciente/',
        page: () => const AddPaciente(),
        transition: Transition.zoom),
    GetPage(
        name: '/gravapaciente/',
        page: () => GravaPaciente(
              form: formPaciente,
            ),
        transition: Transition.zoom),
    GetPage(
      name: '/foto/',
      page: () => const Foto(),
      transition: Transition.zoom,
    ),
    GetPage(
        name: '/foto2/',
        page: () => Fotos2(
              afoto: markerImageFile2,
            ),
        transition: Transition.zoom),
    GetPage(
      name: '/pin/',
      page: () => const Pin(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/grid/',
      page: () => const GridStagerade(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/setup/',
      page: () => const Setup(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/agenda/',
      page: () => const AgendaPacientes(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/picker2/',
      page: () => const Picker2(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/picker1/',
      page: () => const Picker(),
      transition: Transition.zoom,
    ),
/*


                  filteredPacientes: filteredPacientes,
                  index: null,


        GetPage(
            name: '/pagina2/',
            page: () => Pagina2(
                  texto: texto,
                ),
            transition: Transition.zoom),

        GetPage(
            name: '/pagina3',
            page: () => Pagina3(
                  teste: teste,
                ),
            transition: Transition.zoom),
        GetPage(
            name: '/pagina4',
            page: () => const Pagina4(),
            transition: Transition.zoom),

*/
  ];
}
