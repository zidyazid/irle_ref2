import 'package:flutter/material.dart';
import 'package:irle_ref2/models/kuis_model.dart';
import 'package:irle_ref2/pages/kuis_page.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class DetailMateriPage extends StatelessWidget {
  // const DetailMateriPage({ Key? key }) : super(key: key);

  final String penjelasan;
  final String judul;
  final String strukturPositif;
  final String strukturNegatif;
  final String strukturPertanyaan;
  final String contohPositif;
  final String contohNegatif;
  final String contohPertanyaan;
  final int id;

  DetailMateriPage(
      {this.penjelasan,
      this.judul,
      this.strukturPositif,
      this.strukturNegatif,
      this.strukturPertanyaan,
      this.contohPositif,
      this.contohNegatif,
      this.contohPertanyaan,
      this.id});

  @override
  Widget build(BuildContext context) {
    KuisProvider kuisProvider = Provider.of<KuisProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Materi",
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      );
    }

    Widget content() {
      return ListView(padding: EdgeInsets.all(24), children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: TITLE
              Text(
                judul,
                style: titleTextStyle.copyWith(color: primaryColor),
              ),
              SizedBox(height: 24),
              // NOTE: ISI
              Text(
                penjelasan,
                style: textStyle1.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              // NOTE: STRUKTUR POSITIF
              Text(
                "Struktur Positif",
                style: subTitleTextStyle.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              Text(
                strukturPositif,
                style: textStyle1.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              // NOTE: STRUKTUR POSITIF
              Text(
                "Struktur Negatif",
                style: subTitleTextStyle.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              Text(
                strukturNegatif,
                style: textStyle1.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              // NOTE: STRUKTUR POSITIF
              Text(
                "Struktur Kata Tanya",
                style: subTitleTextStyle.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              Text(
                strukturPertanyaan,
                style: textStyle1.copyWith(color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: blueColor, elevation: 1.0),
                      onPressed: () {
                        // var kuis = kuisProvider.getKuises(id.toString());
                        // print(kuis);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KuisPage(
                                      id: id,
                                    )));
                      },
                      child: Text(
                        "Kuis",
                        style: subTitleTextStyle.copyWith(color: whiteColor),
                      )),
                ],
              )
            ],
          ),
        ),
      ]);
    }

    return Scaffold(appBar: header(), body: content());
  }
}
