import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/pages/submenu_page.dart';
import 'package:irle_ref2/providers/submenu_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class MateriTile extends StatefulWidget {
  // const MateriTile({ Key? key }) : super(key: key);

  final int id;
  final String judul;

  MateriTile({this.judul, this.id});

  @override
  _MateriTileState createState() => _MateriTileState();
}

class _MateriTileState extends State<MateriTile> {
  @override
  Widget build(BuildContext context) {
    SubmenuProvider _submenuProvider = Provider.of<SubmenuProvider>(context);
    return GestureDetector(
      onTap: () {
        print('judul materi adalah ' + widget.judul);
        print(_submenuProvider.getSubmenus(widget.id));
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SubmenuPage(
                        id: widget.id,
                      )));
        });
      },
      child: Container(
        // color: Colors.red,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //     width: 100,
            //     // color: Colors.red,
            //     child: Text(judul,
            //         overflow: TextOverflow.ellipsis, style: textStyle1)),
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
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.judul,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Text(
                  //   desc,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: textStyle1,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
