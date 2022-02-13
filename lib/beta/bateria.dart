import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Bateria extends StatefulWidget {
  const Bateria({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BateriaState createState() => _BateriaState();
}

var bateria = 0;
int batteryLevel2 = 0;

class _BateriaState extends State<Bateria> {
  final Battery _battery = Battery();
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  teste() async {
    final batteryLevel = await _battery.batteryLevel;
    setState(() {
      batteryLevel2 = batteryLevel;
    });
  }

  @override
  void initState() {
    teste();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível da Bateria'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 150,
              lineWidth: 35,
              percent: batteryLevel2 / 100,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: testa(),
              backgroundColor: Colors.blue.shade200,
              center: Text(
                '${batteryLevel2.toString()}%',
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                final batteryLevel = await _battery.batteryLevel;
                setState(() {
                  batteryLevel2 = batteryLevel;
                });
                // ignore: unawaited_futures
              },
              child: const Text('Atualizar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }

  testa() {
    if (batteryLevel2 >= 30) {
      return Colors.blue.shade800;
    } else {
      return Colors.red.shade800;
    }
  }
}

/*

final QuickActions quickActions = const QuickActions();
quickActions.initialize((shortcutType) {
  if (shortcutType == 'action_main') {
    print('The user tapped on the "Main view" action.');
  }
  // More handling code...
});
Finally, manage the app's quick actions, for instance:

quickActions.setShortcutItems(<ShortcutItem>[
  const ShortcutItem(type: 'action_main', localizedTitle: 'Main view', icon: 'icon_main'),
  const ShortcutItem(type: 'action_help', localizedTitle: 'Help', icon: 'icon_help')
]);




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class Bateria extends StatefulWidget {
  const Bateria({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BateriaState createState() => _BateriaState();
}

class _BateriaState extends State<Bateria> {
  final Battery _battery = Battery();

  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    _battery.batteryState.then(_updateBatteryState);
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen(_updateBatteryState);
  }

  void _updateBatteryState(BatteryState state) {
    if (_batteryState == state) return;
    setState(() {
      _batteryState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tia Marleny Bateria'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//            Text('$_batteryState'),
//           const SizedBox(
//              height: 60,
//            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                final batteryLevel = await _battery.batteryLevel;
                // ignore: unawaited_futures
                showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 9, 38, 63),
                    content: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        '$batteryLevel %',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              },
              child: const Text(
                'Ver Bateria',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color.fromARGB(255, 219, 16, 60),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Sair',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }
}


*/
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class Bateria extends StatefulWidget {
  const Bateria({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BateriaState createState() => _BateriaState();
}

class _BateriaState extends State<Bateria> {
  final Battery _battery = Battery();

  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    _battery.batteryState.then(_updateBatteryState);
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen(_updateBatteryState);
  }

  void _updateBatteryState(BatteryState state) {
    if (_batteryState == state) return;
    setState(() {
      _batteryState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tia Marleny Bateria'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
//            Text('$_batteryState'),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                final batteryLevel = await _battery.batteryLevel;
                // ignore: unawaited_futures
                showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 9, 38, 63),
                    content: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        '$batteryLevel %',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              },
              child: const Text(
                'Ver Bateria',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }
}

*/