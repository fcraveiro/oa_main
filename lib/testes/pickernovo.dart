import 'package:flutter/material.dart';

class Picker2 extends StatefulWidget {
  const Picker2({Key? key}) : super(key: key);

  @override
  State<Picker2> createState() => _Picker2State();
}

class _Picker2State extends State<Picker2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('picker'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Foto'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Galeria'),
          ),
        ],
      ),
    );
  }
}
