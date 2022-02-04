import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class GridStagerade extends StatefulWidget {
  const GridStagerade({Key? key}) : super(key: key);

  @override
  _GridStageradeState createState() => _GridStageradeState();
}

class _GridStageradeState extends State<GridStagerade> {
  List<String> imageList = [
    'https://www.clinicacliniface.com.br/img/CasoClinico/fotos/g/cliniface_noticia_14042020_143054219.jpg',
    'http://bigarellaortodontia.com.br/wp-content/uploads/2018/08/13-Gisele-Varanis.jpg',
    'https://domclinica.com.br/wp-content/uploads/2020/11/f566ab7d-51ea-43b9-b40d-e469f9c42fdd.jpg',
    'https://www.dentalnet.com.br/images/img-mpi/dente-do-juizo-nascendo-sintomas-2.jpg',
    'https://clinicaodontomania.com.br/wp-content/uploads/2016/04/hipersensibilidade1-1.jpg',
    'https://picsum.photos/seed/image009/500/600',
    'https://picsum.photos/seed/image010/500/900',
    'https://picsum.photos/seed/image011/500/900',
    'https://picsum.photos/seed/image012/500/700',
    'https://picsum.photos/seed/image013/500/700',
    'https://picsum.photos/seed/image014/500/800',
    'https://picsum.photos/seed/image015/500/500',
    'https://picsum.photos/seed/image016/500/700',
    'https://picsum.photos/seed/image017/500/600',
    'https://picsum.photos/seed/image018/500/900',
    'https://picsum.photos/seed/image019/500/800',
    'https://picsum.photos/seed/image010/500/900',
    'https://picsum.photos/seed/image011/500/900',
    'https://picsum.photos/seed/image012/500/700',
    'https://picsum.photos/seed/image006/500/500',
    'https://picsum.photos/seed/image007/500/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico Tratamento'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 06,
            mainAxisSpacing: 06,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}
