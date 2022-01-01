import 'package:flutter/material.dart';
// import 'package:irle_ref2/models/user_model.dart';
// import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/materi_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/materi_tile.dart';
import 'package:provider/provider.dart';

class MateriPage extends StatelessWidget {
  // const MateriPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MateriProvider materiProvider = Provider.of<MateriProvider>(context);

    Widget content() {
      return Container(
        width: double.infinity,
        color: whiteColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Image.asset(
              "assets/materi_img.png",
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.width / 2) + 50),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                // padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: materiProvider.materies
                      .map(
                        (materi) => MateriTile(
                            judul: materi.judul,
                            name: materi.name,
                            desc: materi.penjelasan),
                      )
                      .toList(),
                  // children: [
                  //   Text("Tenses Timeline",
                  //       style: textStyle1.copyWith(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.w100,
                  //           color: darkGrey)),
                  //   SizedBox(
                  //     height: 30,
                  //   ),
                  //   MateriTile(),
                  //   MateriTile(),
                  // ],
                ))
          ]),
          // SizedBox(height: 24),
        ]),
      );
    }

    return content();
  }
}
