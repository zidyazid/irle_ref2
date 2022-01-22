import 'package:flutter/material.dart';

import '../../theme.dart';

class StatusPage extends StatelessWidget {
  // const StatusPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset('assets/status_img.png'),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Kosa Kata : ',
                style: subTitleTextStyle.copyWith(color: darkGrey)),
            Text('120', style: subTitleTextStyle.copyWith(color: blueColor)),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Text('Skor Kuis Permateri : ',
            style: subTitleTextStyle.copyWith(color: darkGrey)),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Past Tense : ',
                style: subTitleTextStyle.copyWith(color: darkGrey)),
            Text('20',
                style: subTitleTextStyle.copyWith(color: Colors.red[400])),
          ],
        ),
        Divider(
          thickness: 1.5,
        )
      ]),
    );
  }
}
