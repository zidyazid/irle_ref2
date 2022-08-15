import 'package:flutter/material.dart';
// import 'package:irle_ref2/models/user_model.dart';
// import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/materi_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/materi_tile.dart';
import 'package:irle_ref2/widgets/none_data_materi_tile.dart';
import 'package:provider/provider.dart';

class MateriPreview extends StatelessWidget {
  // const MateriPreview({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MateriProvider materiProvider = Provider.of<MateriProvider>(context);
    print(materiProvider.getMateries());

    Widget content() {
      return Container(
        width: double.infinity,
        color: Colors.blue[50],
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 30),
          Stack(children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Image.asset("assets/tenses_timeline.png", height: 200)),
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
                        (materi) => NoneDataMateriTile(
                          id: materi.id,
                          judul: materi.judul,
                        ),
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
