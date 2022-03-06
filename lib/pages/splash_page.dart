import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/materi_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // @override
  void initState() {
    // TODO: implement initState

    openSplashScreen();
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    this.getDataKosaKata();
  }

  getDataKosaKata() async {
    await Provider.of<KosaKataProvider>(context, listen: false).getKosaKata();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    final box = GetStorage();
    print(box.getValues());
    int id = box.read('id');
    print('id user sebelumnya adalah : ' + id.toString());
    await Provider.of<MateriProvider>(context, listen: false).getMateries();
    Navigator.pushReplacementNamed(context, '/onboarding');
    // WidgetsFlutterBinding.ensureInitialized();
    // dynamic name = FlutterSession().get('name');
    id != null
        ? Navigator.pushReplacementNamed(context, '/main-page')
        : Navigator.pushReplacementNamed(context, '/onboarding');
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
