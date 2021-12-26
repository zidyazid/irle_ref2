import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class DetailMateriPage extends StatelessWidget {
  // const DetailMateriPage({ Key? key }) : super(key: key);

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
              "Present Tense",
              style: titleTextStyle.copyWith(color: primaryColor),
            ),
            SizedBox(height: 24),
            // NOTE: ISI
            Text(
              "Nisi tempor sunt quis deserunt duis ullamco non veniam proident nulla ad velit minim. Sunt mollit fugiat consequat deserunt adipisicing esse esse fugiat.",
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
              "Subject + to be + prediket",
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
              "Subject + to be + Not + prediket",
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
                    onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header(), body: content());
  }
}
