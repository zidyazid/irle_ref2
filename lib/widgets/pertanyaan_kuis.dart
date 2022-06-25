import 'package:flutter/material.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class PertanyaanKuis extends StatefulWidget {
  // const PertanyaanKuis({ Key? key }) : super(key: key);

  final int index;

  PertanyaanKuis(this.index);

  @override
  _PertanyaanKuisState createState() => _PertanyaanKuisState();
}

class _PertanyaanKuisState extends State<PertanyaanKuis> {
  int pertanyaanKe = 1;
  @override
  Widget build(BuildContext context) {
    KuisProvider kuisProvider = Provider.of<KuisProvider>(context);

    Widget content() {
      return Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Pertanyaan :",
              style: textStyle1.copyWith(color: whiteColor, fontSize: 18),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              kuisProvider.kuises[widget.index].pertanyaan,
              style: textStyle1.copyWith(color: whiteColor, fontSize: 18),
            ),
            SizedBox(
              height: 24,
            ),
          ]),
        ],
      );
    }

    return content();
  }
}
