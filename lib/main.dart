import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oa_main/inicio.dart';
import 'package:oa_main/menu.dart';
import 'package:oa_main/unknowpage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF7B1FA2),
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotas Getx',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), //
        Locale('pt', 'BR'), //
      ],
      locale: const Locale('pt', 'BR'),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const UnkNowPage()),
      getPages: [
        GetPage(name: '/', page: () => const Inicio()),
        GetPage(
            name: '/inicio',
            page: () => const Inicio(),
            transition: Transition.zoom),
        GetPage(
            name: '/menu/',
            page: () => const Menu(),
            transition: Transition.zoom),

/*
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
      ],
    );
  }
}
