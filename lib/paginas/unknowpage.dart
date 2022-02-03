import 'package:flutter/material.dart';

class UnkNowPage extends StatefulWidget {
  const UnkNowPage({Key? key}) : super(key: key);

  @override
  _UnkNowPageState createState() => _UnkNowPageState();
}

class _UnkNowPageState extends State<UnkNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Caminho Invalido'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
