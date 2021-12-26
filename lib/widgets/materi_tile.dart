import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class MateriTile extends StatelessWidget {
  // const MateriTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-materi');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        margin: EdgeInsets.only(
          top: 24,
        ),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blue[100],
          ),
          color: Colors.blue[100],
        ),
        child: Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Present Tenses",
              style: titleTextStyle.copyWith(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            Text("Present Tenses",
                style: subTitleTextStyle.copyWith(fontSize: 12),
                overflow: TextOverflow.ellipsis),
          ]),
        ),
      ),
    );
  }
}
