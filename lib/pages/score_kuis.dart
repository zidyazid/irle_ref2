import 'package:flutter/material.dart';

class ScoreKuis extends StatelessWidget {
  // const ScoreKuis({ Key? key }) : super(key: key);

  final String imgUrl;
  final int score;
  ScoreKuis({this.imgUrl, this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            'assets/$imgUrl',
            width: 20.0,
          ),
        ),
      ),
    );
  }
}
