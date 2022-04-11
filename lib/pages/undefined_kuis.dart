import 'package:flutter/material.dart';

import '../theme.dart';

class UndefinedKuis extends StatelessWidget {
  // const UndefinedKuis({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        width: double.infinity,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/undefinedkuis.jpg"),
            Text(
              "Oops tidak ditemukan kuis yang cocok dengan materi",
              // style: subTitleTextStyle,
              // textAlign: TextAlign.center,
            )
          ],
        )),
      ),
    );
  }
}
