import 'package:flutter/material.dart';
import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/theme.dart';

class MateriTile extends StatelessWidget {
  // const MateriTile({ Key? key }) : super(key: key);
  final String judul;
  final String name;
  final String desc;
  final String strukturPositif;
  final String strukturNegatif;
  final String strukturPertanyaan;
  final String contohPositif;
  final String contohNegatif;
  final String contohPertanyaan;
  final int id;

  MateriTile(
      {this.judul,
      this.name,
      this.desc,
      this.strukturPositif,
      this.strukturNegatif,
      this.strukturPertanyaan,
      this.contohPositif,
      this.contohNegatif,
      this.contohPertanyaan,
      this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => DetailMateriPage(
                    judul: judul,
                    penjelasan: desc,
                    strukturPositif: strukturPositif,
                    strukturNegatif: strukturNegatif,
                    strukturPertanyaan: strukturPertanyaan,
                    contohPositif: contohPositif,
                    contohNegatif: contohNegatif,
                    contohPertanyaan: contohPertanyaan,
                    id: id)));
      },
      child: Container(
        // color: Colors.red,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 100,
                // color: Colors.red,
                child: Text(name,
                    overflow: TextOverflow.ellipsis, style: textStyle1)),
            Column(
              children: [
                Image.asset('assets/circle.png', height: 22),
                Image.asset(
                  'assets/line.png',
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
