// ignore_for_file: deprecated_member_use

//import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef OnError = void Function(Exception exception);

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  _Pagina1 createState() => _Pagina1();
}

class _Pagina1 extends State<Pagina1> {
  final Duration _duration = const Duration();
  final Duration _position = const Duration();
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);

//    advancedPlayer.durationHandler = (d) => setState(() {
//          _duration = d;
//        });

//    advancedPlayer.positionHandler = (p) => setState(() {
//          _position = p;
//        });
  }

  late String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) =>
                    Container(child: w, padding: const EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: SizedBox(
        width: 150,
        height: 45,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(txt),
            color: const Color(0xFF48426D),
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.pink,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  // ignore: non_constant_identifier_names
  Widget LocalAudio() {
    return _tab([
      _btn('Play', () => audioCache.play('audios/som.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop()),
      slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Musica Local'),
          centerTitle: true,
          backgroundColor: const Color(0xFF48426D),
        ),
        body: TabBarView(
          children: [LocalAudio()],
        ),
      ),
    );
  }
}





/*
// ignore_for_file: unnecessary_const

//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
//  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musica Assets'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                somPlay();
              },
              child: const Text('Play'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(185, 45),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                somStop();
              },
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }

  somPlay() async {
//    await assetsAudioPlayer.open(
//      Audio("assets/audios/som.mp3"),
//    );
  }

  somStop() async {
//    await assetsAudioPlayer.stop();
  }
}
*/