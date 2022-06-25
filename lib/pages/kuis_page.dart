import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/pages/score_kuis.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
// import 'package:irle_ref2/pages/home/main_page.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:irle_ref2/widgets/pertanyaan_kuis.dart';
// import 'package:irle_ref2/widgets/pertanyaan_kuis.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class KuisPage extends StatefulWidget {
  // const KuisPage({ Key? key }) : super(key: key);
  final int materiId;
  final int id;
  final int jumlahPertanyaan;

  KuisPage({this.materiId, this.id, this.jumlahPertanyaan});
  @override
  _KuisPageState createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  // @override

  // KuisProvider kuisProvider = Provider.of<KuisProvider>(context, listen: false);
  TextEditingController jawabanController = TextEditingController();
  // NOTE INDEX ARRAY KUIS
  int index = 0;
  int pertanyaanKe = 1;
  double score = 0;

  void initState() {
    getKuisData();
    print(getKuisData());
    super.initState();
  }

  getKuisData() async {
    await Provider.of<KuisProvider>(context, listen: false)
        .getKuises(widget.id.toString());

    // print(data);
  }

  handleAlert() {
    return Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    KuisProvider kuisProvider = Provider.of<KuisProvider>(context);
    Widget appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor:
            (widget.jumlahPertanyaan > index) ? primaryColor : blueColor,
        title: Text(
          (widget.jumlahPertanyaan > index) ? "Quiz" : "",
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      );
    }

    Widget hasilKuis(double score) {
      final box = GetStorage();
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: blueColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                (score < 50)
                    ? 'assets/kuis_failed.png'
                    : 'assets/kuis_success.png',
                width: 200.0,
              ),
              SizedBox(height: 12),
              Text((score < 50) ? 'Oopss !!' : 'Yeaah',
                  style: titleTextStyle.copyWith(fontSize: 32)),
              SizedBox(height: 12),
              Text('Total Score Anda : ' + score.toString(),
                  style: titleTextStyle),
              SizedBox(height: 12),
              Container(
                width: 270,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: whiteColor),
                    onPressed: () async {
                      print(widget.id);
                      await StatusProvider().add(
                          box.read('token'),
                          widget.materiId,
                          score.toInt(),
                          box.read('id'),
                          widget.id);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main-page', (route) => false);
                    },
                    child: Text("Lanjut Belajar")),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Text(
              "Pertanyaan Ke :",
              style: textStyle1.copyWith(color: primaryColor),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pertanyaanKe.toString() + " / ",
                    style: titleTextStyle.copyWith(
                      fontSize: 48,
                      color: primaryColor,
                    )),
                Text(kuisProvider.kuises.length.toString(),
                    style: titleTextStyle.copyWith(
                      fontSize: 48,
                      color: primaryColor,
                    )),
              ],
            ),
            Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [primaryColor, sekunderColor]),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PertanyaanKuis(index),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                          controller: jawabanController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Jawaban Anda",
                            hintStyle: textStyle1,
                          )),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: whiteColor,
                          ),
                          onPressed: () {
                            // print("benar");
                            // print(index.toString());
                            var jawabanUser =
                                jawabanController.text.toLowerCase();
                            if (jawabanUser ==
                                kuisProvider.kuises[index].jawaban
                                    .toLowerCase()) {
                              setState(() {
                                if (index < kuisProvider.kuises.length) {
                                  score = score + 20.0;
                                  AlertDialog alertTrue = AlertDialog(
                                    content: Container(
                                      width: double.infinity,
                                      height: 400,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/true.png"),
                                          Text("Skor : " + score.toString()),
                                          Text(
                                            "Yeay!",
                                            style: titleTextStyle.copyWith(
                                                color: primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return alertTrue;
                                      });

                                  pertanyaanKe++;
                                  index++;

                                  jawabanController.text = "";
                                } else {
                                  if (score > 50) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScoreKuis(
                                                  imgUrl: 'kuis_success.png',
                                                  id: widget.id,
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScoreKuis(
                                                  imgUrl: 'kuis_failed.png',
                                                  id: widget.id,
                                                )));
                                  }
                                }
                              });

                              return;
                            } else {
                              score = score + 0;
                              AlertDialog alertFalse = AlertDialog(
                                content: Container(
                                  width: double.infinity,
                                  height: 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/false.png"),
                                      Text("Skor : " + score.toString()),
                                      Text(
                                        "Ooopss!",
                                        style: titleTextStyle.copyWith(
                                            color: primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (context) => alertFalse);

                              pertanyaanKe++;
                              index++;
                              jawabanController.text = "";

                              print("salah");
                              return;
                            }
                          },
                          child: Text("Kirim")),
                    ),
                  ],
                ))
          ],
        ),
      );
    }

    print('nilai index : $index');
    print('nilai index : ' + kuisProvider.kuises.length.toString());
    return Scaffold(
      appBar: appBar(),
      body: ListView(children: [
        (widget.jumlahPertanyaan > index) ? content() : hasilKuis(score)
      ]),
    );
  }
}
