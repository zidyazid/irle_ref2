import 'package:flutter/material.dart';
import 'package:irle_ref2/models/kuis_model.dart';
import 'package:irle_ref2/pages/kuis_page.dart';
import 'package:irle_ref2/pages/undefined_kuis.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class DetailMateriPage extends StatefulWidget {
  // const DetailMateriPage({ Key? key }) : super(key: key);

  final String penjelasan;
  final String judul;
  final int id;
  final int materiId;

  DetailMateriPage({this.penjelasan, this.judul, this.id, this.materiId});

  @override
  _DetailMateriPageState createState() => _DetailMateriPageState();
}

class _DetailMateriPageState extends State<DetailMateriPage> {
  getKuisData() async {
    await Provider.of<KuisProvider>(context, listen: false)
        .getKuises(widget.id.toString());

    // print(data);
  }

  void initState() {
    getKuisData();
    print(getKuisData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    KuisProvider kuisProvider = Provider.of<KuisProvider>(context);
    // KuisProvider _kuis = Provider.of<KuisProvider>(context).getKuises(widget.id) as KuisProvider;

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
      // int notId = widget.id.toInt() + 4;
      return ListView(padding: EdgeInsets.all(24), children: [
        // Expanded(
        //   child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: TITLE
            Text(
              widget.judul,
              style: titleTextStyle.copyWith(color: primaryColor),
            ),
            SizedBox(height: 24),
            // NOTE: ISI
            Text(
              widget.penjelasan,
              style: textStyle1.copyWith(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16),
            // NOTE: STRUKTUR POSITIF

            // SizedBox(height: 24),
            (widget.judul == "Penjelasan Dasar")
                ? SizedBox(height: 24)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: blueColor, elevation: 1.0),
                          onPressed: () {
                            // var kuis = kuisProvider.getKuises(id.toString());
                            // print(kuis);
                            print(widget.id);
                            print("id kuis =" + widget.id.toString());
                            (kuisProvider.kuises.length.toInt() == 0)
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UndefinedKuis()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KuisPage(
                                              id: widget.id,
                                              jumlahPertanyaan:
                                                  kuisProvider.kuises.length,
                                              materiId: widget.materiId,
                                            )));

                            print(kuisProvider.kuises.length.toInt());
                          },
                          child: Text(
                            "Kuis",
                            style:
                                subTitleTextStyle.copyWith(color: whiteColor),
                          )),
                    ],
                  )
          ],
        ),
        // ),
      ]);
    }

    return Scaffold(appBar: header(), body: content());
  }
}
