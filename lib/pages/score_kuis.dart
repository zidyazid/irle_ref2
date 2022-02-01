import 'package:flutter/material.dart';

class ScoreKuis extends StatelessWidget {
  // const ScoreKuis({ Key? key }) : super(key: key);

  final String imgUrl;
  final int score;
  final int id;
  ScoreKuis({this.imgUrl, this.score, this.id});

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
