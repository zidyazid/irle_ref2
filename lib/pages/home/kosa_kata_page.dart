// import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/memorizing_detail_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/custom_tabbar.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class KosaKataPage extends StatefulWidget {
  // const KosaKataPage({ Key? key }) : super(key: key);

  @override
  _KosaKataPageState createState() => _KosaKataPageState();
}

class _KosaKataPageState extends State<KosaKataPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.getDataMemorizingDetail();
  }

  getDataMemorizingDetail() async {
    await Provider.of<KosaKataProvider>(context, listen: false).getKosaKata();
    await Provider.of<MemorizingDetailProvider>(context, listen: false)
        .getMemorizingDetail(box.read('id'));
    // setState(() {
    //   selectedIndex = 1;
    //   // });
    // });
  }

  getData(token, kosakataId) async {
    var memorized =
        await MemorizingDetailProvider().add(token, box.read('id'), kosakataId);
    await Provider.of<KosaKataProvider>(context, listen: false).getKosaKata();
    await Provider.of<MemorizingDetailProvider>(context, listen: false)
        .getMemorizingDetail(box.read('id'));
    print(memorized);
    if (memorized == true) {
      showTopSnackBar(context,
          CustomSnackBar.success(message: 'Yeay! Kosa kata berhasil dihapal'));
    } else {
      showTopSnackBar(
          context,
          CustomSnackBar.error(
              message: 'Ooops! Kata tersebut telah dihapal sebelumnya'));
    }
  }

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final box = GetStorage();

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // var token = box.read('token');
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    KosaKataProvider _kosaKataProvider = Provider.of<KosaKataProvider>(context);
    MemorizingDetailProvider _memorizingDetail =
        Provider.of<MemorizingDetailProvider>(context);

    Widget memorizedCard(
      String verb1,
      String verb2,
      String verb3,
      String translate,
      String verbing,
    ) {
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
                  Text("reguler",
                      style: subTitleTextStyle.copyWith(color: darkGrey))
                ],
              ),
              SizedBox(height: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb 2 :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verb2,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb 3 :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verb3,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb ing :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verb2,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Translate :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(translate,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ],
          ));
    }

    Widget cardWords(
        String token,
        int userId,
        int kosakataId,
        String regulerKategori,
        String verb1,
        String verb2,
        String verb3,
        String translate,
        String verbing,
        int id) {
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
                  Text(regulerKategori,
                      style: subTitleTextStyle.copyWith(
                          color: (regulerKategori == "reguler")
                              ? primaryColor
                              : blueColor))
                ],
              ),
              SizedBox(height: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb 2 :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verb2,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb 3 :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verb3,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("verb ing :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(verbing,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Translate :",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                      Text(translate,
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: blueColor),
                      onPressed: () {
                        print(id.toString());
                        setState(() {
                          // _memorizingDetail.add(token, userId, kosakataId);

                          // print(kosakataId);
                          //  Timer(Duration(seconds: 3), () {
                          // selectedIndex = 1;
                          // });
                          // Timer(Duration(seconds: 5), () {
                          (user == null && box.getValues() == null)
                              ? Alert(
                                      context: context,
                                      title: "Sorry!",
                                      desc:
                                          "Kamu belum bisa mengakses halaman ini sebelum login kedalam aplikasi")
                                  .show()
                              : getData(token, kosakataId);
                        });

                        // Timer(Duration(milliseconds: 2), () {
                        //   selectedIndex = 1;
                        // });
                      },
                      child: Text("+ Telah dihapal",
                          style: textStyle1.copyWith(
                              color: whiteColor, fontSize: 14)),
                    ),
                  )
                ],
              ),
            ],
          ));
    }

    Widget content() {
      final box = GetStorage();
      return Column(
        children: [
          // Text(_memorizingDeta),
          CustomTabBar(
            titles: ['Words', 'My Words'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;

                print(selectedIndex);
                print(box.read('id'));
                print(_memorizingDetail);
              });
            },
          ),
          SizedBox(height: 24),

          Builder(builder: (_) {
            Widget body = (selectedIndex == 0)
                ? Column(
                    children: _kosaKataProvider.vocabullaries
                        .map((vocabullary) => (user == null &&
                                box.read('id') == null)
                            ? Column(
                                children: [
                                  cardWords(
                                      null,
                                      null,
                                      null,
                                      "reguler",
                                      "Sing",
                                      "Sang",
                                      "Sung",
                                      "bernyani",
                                      "Singing",
                                      null),
                                ],
                              )
                            : cardWords(
                                (user != null) ? user.token : box.read('token'),
                                (user != null) ? user.id : box.read('id'),
                                vocabullary.id,
                                vocabullary.regulerKategori,
                                vocabullary.verb1,
                                vocabullary.verb2,
                                vocabullary.verb3,
                                vocabullary.translate,
                                vocabullary.verbing,
                                vocabullary.id))
                        .toList(),
                  )
                : Column(
                    children: _memorizingDetail.memorizingDetails
                        .map((memorizingDetail) =>
                            (box.read('id') == null && user == null)
                                ? Text("Kamu belum memiliki kosa kata")
                                : memorizedCard(
                                    // memorizingDetail.verb1,
                                    memorizingDetail.verb1,
                                    memorizingDetail.verb2,
                                    memorizingDetail.verb3,
                                    memorizingDetail.translate,
                                    memorizingDetail.verbing,
                                  ))
                        .toList(),
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
