import 'package:flutter/material.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/widgets/pertanyaan_kuis.dart';
// import 'package:irle_ref2/widgets/pertanyaan_kuis.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class KuisPage extends StatefulWidget {
  // const KuisPage({ Key? key }) : super(key: key);
  final int id;

  KuisPage({this.id});
  @override
  _KuisPageState createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  @override
  TextEditingController jawabanController = TextEditingController();
  // NOTE INDEX ARRAY KUIS
  int index = 0;
  int pertanyaanKe = 1;
  int score = 0;

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

  Widget build(BuildContext context) {
    KuisProvider kuisProvider = Provider.of<KuisProvider>(context);
    Widget appBar() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Quiz",
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      );
    }

    Widget content() {
      return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 6),
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
                                kuisProvider.kuises[index].jawaban) {
                              setState(() {
                                index++;
                                pertanyaanKe++;
                                score = score + 10;
                              });
                              print("benar");
                              print("$score");
                            } else {
                              print("salah");
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

    return Scaffold(
      appBar: appBar(),
      body: ListView(children: [
        index < kuisProvider.kuises.length ? content() : Text("Finish")
      ]),
    );
  }
}
