import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class MateriTile extends StatelessWidget {
  // const MateriTile({ Key? key }) : super(key: key);
  final String judul;
  final String name;
  final String desc;

  MateriTile({this.judul, this.name, this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-materi');
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
