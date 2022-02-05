/*
import 'package:flutter/material.dart';

import '/services/model.dart';

class FotosDetalhes extends StatelessWidget {
  const FotosDetalhes({
    Key? key,
    required this.campos,
  }) : super(key: key);

  final Historico campos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image${campos.hisPathThumb}",
              child: Image.network(campos.hisPathServer),
            ),
            const SizedBox(
              height: 0.0,
            ),
            // ignore: deprecated_member_use
            OutlineButton(
              child: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

*/
/*


            Hero(
              tag: "image${campos.hisPathThumb}",
              child: Image.network(
                campos.hisPathServer,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),

*/