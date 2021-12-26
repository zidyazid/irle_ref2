import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/materi_tile.dart';

class MateriPage extends StatelessWidget {
  // const MateriPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset("assets/materi_img.png"),
      SizedBox(height: 24),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("materi", style: textStyle1),
              MateriTile(),
              MateriTile(),
              MateriTile(),
              MateriTile(),
              MateriTile(),
              MateriTile(),
              MateriTile(),
            ],
          ))
    ]);
  }
}
