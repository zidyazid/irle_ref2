import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class StatusPage extends StatefulWidget {
  // const StatusPage({ Key? key }) : super(key: key);
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Widget build(BuildContext context) {
    StatusProvider _statusProvider = Provider.of<StatusProvider>(context);

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset('assets/status_img.png'),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Kosa Kata : ',
                    style: subTitleTextStyle.copyWith(color: darkGrey)),
                Text('120',
                    style: subTitleTextStyle.copyWith(color: blueColor)),
              ],
            ),
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
        Column(
          children: _statusProvider.statuses
              .map(
                (status) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(status.judul + ' : ',
                            style: subTitleTextStyle.copyWith(color: darkGrey)),
                        Text(status.score.toString(),
                            style: subTitleTextStyle.copyWith(
                                color: Colors.red[400])),
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ]),
    );
  }
}
