import 'package:flutter/material.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/custom_tabbar.dart';
import 'package:provider/provider.dart';

class KosaKataPage extends StatefulWidget {
  // const KosaKataPage({ Key? key }) : super(key: key);

  @override
  _KosaKataPageState createState() => _KosaKataPageState();
}

class _KosaKataPageState extends State<KosaKataPage> {
  void initState() {
    // TODO: implement initState
    getDataKosaKata();
    super.initState();
  }

  getDataKosaKata() async {
    await Provider.of<KosaKataProvider>(context, listen: false).getKosaKata();
  }

  Widget build(BuildContext context) {
    KosaKataProvider _kosaKataProvider = Provider.of<KosaKataProvider>(context);
    int selectedIndex = 0;
    // @override
    Widget memorizedCard() {
      return Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 12),
          padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: darkGrey,
                    offset: Offset.zero,
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sing",
                style: titleTextStyle.copyWith(color: primaryColor),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Sang")),
                  // SizedBox(width: 18),
                  Expanded(child: Text("Sung")),
                  // SizedBox(width: 18),
                  Expanded(child: Text("Singing")),
                  // SizedBox(width: 18),
                  Expanded(child: Text("bernyanyi")),
                ],
              ),
            ],
          ));
    }

    Widget cardWords(String verb1, String verb2, String verb3, String translate,
        String verbing, int id) {
      return Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 12),
          padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      verb1,
                      style: titleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: whiteColor, elevation: 8.0),
                      onPressed: () {
                        print(id.toString());
                      },
                      child: Text("Telah Dihapal"))
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(verb2)),
                  // SizedBox(width: 18),
                  Expanded(child: Text(verb3)),
                  // SizedBox(width: 18),
                  Expanded(child: Text(verbing)),
                  Expanded(child: Text(translate)),
                ],
              ),
            ],
          ));
    }

    Widget content() {
      return Column(
        children: [
          CustomTabBar(
            titles: ['Words', 'My Words'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 24),
          Builder(builder: (_) {
            Widget body = (selectedIndex == 0)
                ? Column(
                    children: _kosaKataProvider.vocabullaries
                        .map((vocabullary) => cardWords(
                            vocabullary.verb1,
                            vocabullary.verb2,
                            vocabullary.verb3,
                            vocabullary.translate,
                            vocabullary.verbing,
                            vocabullary.id))
                        .toList(),
                  )
                : Column(
                    children: [memorizedCard()],
                  );

            return Center(
              child: body,
            );
          })
        ],
      );
    }

    return content();
  }
}
