import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_testerls.dart';
import 'package:oa_main/services/conectar.dart';

class TesteRls extends StatefulWidget {
  const TesteRls({Key? key}) : super(key: key);

  @override
  State<TesteRls> createState() => _TesteRlsState();
}

int aa2 = 0;

class _TesteRlsState extends State<TesteRls> {
  Conecta conectar = Conecta();

  @override
  void initState() {
//    testa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Procedure Call'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc1();
              },
              child: Text(
                'Votar Pedro',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc2();
              },
              child: Text(
                'Votar Paulo',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc3();
              },
              child: Text(
                'Votar Marcio',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc4(15);
              },
              child: Text(
                'Votar Parametro',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc5(15);
              },
              child: Text(
                'Totalizar',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: conectar.getRLS(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ClassTesteRls>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('erro');
                }
                if (snapshot.hasData) {
                  List<ClassTesteRls>? posts = snapshot.data;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 15),
                        itemCount: posts?.length,
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                posts![index].tes2Nome.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    posts[index].tes2Int1.toString(),
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                    ),
                                  )),
                            ],
                          );
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
