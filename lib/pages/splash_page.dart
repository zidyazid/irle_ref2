import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openSplashScreen();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    var durasiSplash = const Duration(seconds: 3);
    return Timer(durasiSplash, () {
      //pindah ke halaman home
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  Widget build(BuildContext context) {
    Widget content() {
      return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[sekunderColor, primaryColor])),
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo_chatbot.png"))),
            ),
          ));
    }

    return Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          children: [content()],
        ));
  }
}
