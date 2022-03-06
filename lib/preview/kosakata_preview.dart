// import 'package:dropdown_button2/dropdown_button2.dart';
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

class KosaKataPreview extends StatefulWidget {
  // const KosaKataPreview({ Key? key }) : super(key: key);
  final int id;
  KosaKataPreview({this.id});
  @override
  _KosaKataPreviewState createState() => _KosaKataPreviewState();
}

class _KosaKataPreviewState extends State<KosaKataPreview> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.getDataMemorizingDetail();
  }

  getDataMemorizingDetail() async {
    // final box = GetStorage();
    // int id = box.read('id')
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;
    // print(box.read('id'));
    // print(user.id);
    await Provider.of<MemorizingDetailProvider>(context, listen: false)
        .getMemorizingDetail(widget.id);
    // box.read('id') != null
    //     ? await Provider.of<MemorizingDetailProvider>(context, listen: false)
    //         .getMemorizingDetail(box.read('id'))
    //     : await Provider.of<MemorizingDetailProvider>(context, listen: false)
    //         .getMemorizingDetail(user.id);
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    KosaKataProvider _kosaKataProvider = Provider.of<KosaKataProvider>(context);
    MemorizingDetailProvider _memorizingDetail =
        Provider.of<MemorizingDetailProvider>(context);

    Widget memorizedCard() {
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
                      'Sing',
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
                      Text('Sang',
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
                      Text('Sung',
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
                      Text('Singing',
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
                      Text('bernyanyi',
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

    Widget cardWords(String token, int userId, int kosakataId, String verb1,
        String verb2, String verb3, String translate, String verbing, int id) {
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
                  Container(
                    width: double.infinity,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: whiteColor, elevation: 8.0),
                        onPressed: () {
                          print(id.toString());
                          setState(() {
                            // _memorizingDetail.add(token, userId, kosakataId);
                            Alert(
                                    context: context,
                                    title: "!Sorry",
                                    desc:
                                        "Kamu belum bisa mengakses halaman ini sebelum login kedalam aplikasi")
                                .show();

                            // print(kosakataId);
                          });
                        },
                        child: Text("+ Telah dihapal")),
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
                        .map((vocabullary) =>
                            (user == null && box.read('id') == null)
                                ? Column(
                                    children: [
                                      cardWords(
                                          null,
                                          null,
                                          null,
                                          "Sing",
                                          "Sang",
                                          "Sung",
                                          "bernyani",
                                          "Singing",
                                          null),
                                      cardWords(
                                          null,
                                          null,
                                          null,
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          null),
                                      cardWords(
                                          null,
                                          null,
                                          null,
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          null),
                                      cardWords(
                                          null,
                                          null,
                                          null,
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          "dfsdf",
                                          null),
                                    ],
                                  )
                                : cardWords(
                                    user.token,
                                    user.id,
                                    vocabullary.id,
                                    vocabullary.verb1,
                                    vocabullary.verb2,
                                    vocabullary.verb3,
                                    vocabullary.translate,
                                    vocabullary.verbing,
                                    vocabullary.id))
                        .toList(),
                  )
                : Column(children: [memorizedCard()]);

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
