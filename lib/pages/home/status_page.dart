import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class StatusPage extends StatefulWidget {
  // const StatusPage({ Key? key }) : super(key: key);
  final double percentage;
  StatusPage({this.percentage});
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final box = GetStorage();

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    StatusProvider _statusProvider = Provider.of<StatusProvider>(context);

    Widget contentPreview(double percentage) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        (user == null && box.read('id') == null)
            ? Text("Nilai Submateri",
                style: subTitleTextStyle.copyWith(color: Colors.black87))
            : SizedBox(),

        SizedBox(height: 12),
        (user == null && box.read('id') == null)
            ? Text("Bentuk Nominal",
                style: subTitleTextStyle.copyWith(color: Colors.black87))
            : SizedBox(),
        SizedBox(height: 12),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(24)),
            ),
            Material(
              borderRadius: BorderRadius.circular(24),
              child: AnimatedContainer(
                height: 10,
                width: (percentage == 0)
                    ? percentage
                    : (MediaQuery.of(context).size.width / 3) + percentage,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: (percentage < 50) ? lightRed : Colors.green[400]),
              ),
            )
          ],
        ),
        SizedBox(height: 12),
        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         percentage = percentage + 25.0;
        //         print(percentage);
        //       });
        //     },
        //     child: Text("add percentage"))
      ]);
    }

    Widget content() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _statusProvider.statuses
            .map(
              (status) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(status.judul + ' : ',
                      style: subTitleTextStyle.copyWith(color: Colors.black87)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(status.judulSubmenu + ' : ',
                          style: subTitleTextStyle.copyWith(
                              color: Colors.black87)),
                      Text(status.score.toString() + '%',
                          style: subTitleTextStyle.copyWith(
                              color: (status.score > 50)
                                  ? Colors.green
                                  : Colors.red[400])),
                    ],
                  ),
                  contentPreview(status.score.toDouble()),
                  Divider(
                    thickness: 1.5,
                  )
                ],
              ),
            )
            .toList(),
      );
    }

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Image.asset('assets/status_img.png'),
        SizedBox(
          height: 30,
        ),
        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text('Total Kosa Kata : ',
        //             style: subTitleTextStyle.copyWith(color: darkGrey)),
        //         Text('120',
        //             style: subTitleTextStyle.copyWith(color: blueColor)),
        //       ],
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: 24,
        // ),
        (user == null && box.read('id') == null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Icon(Icons.people, size: 50.0),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200])),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                image: NetworkImage(box.read('image')),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Text(box.read('name'),
                          style: subTitleTextStyle.copyWith(
                              color: Colors.black87)),
                      // SizedBox(
                      //   height: 3,
                      // ),
                      Text(box.read('email'),
                          style: subTitleTextStyle.copyWith(
                              color: Colors.black38)),
                    ],
                  ),
                ],
              ),
        SizedBox(
          height: 24,
        ),

        SizedBox(
          height: 12,
        ),
        Text('Skor Kuis Permateri : ',
            style: subTitleTextStyle.copyWith(color: Colors.black87)),
        SizedBox(
          height: 12,
        ),
        (user == null && box.read('id') == null)
            ? contentPreview(50)
            : content()
      ]),
    );
  }
}
