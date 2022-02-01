import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/memorizing_detail_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/custom_tabbar.dart';
import 'package:provider/provider.dart';

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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    print("id dari user yang sedang login adalah : " + user.id.toString());
    await Provider.of<MemorizingDetailProvider>(context, listen: false)
        .getMemorizingDetail(user.id);
  }

  int selectedIndex = 0;
  // @override

  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                verb1,
                style: titleTextStyle.copyWith(color: primaryColor),
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
                  // SizedBox(width: 18),
                  Expanded(child: Text(translate)),
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
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: whiteColor, elevation: 8.0),
                      onPressed: () {
                        print(id.toString());
                        setState(() {
                          // _memorizingDetail.add(token, userId, kosakataId);
                          MemorizingDetailProvider()
                              .add(token, userId, kosakataId);
                          // print(kosakataId);
                        });
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
          // Text(_memorizingDeta),
          CustomTabBar(
            titles: ['Words', 'My Words'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                print(user.id.toString());
                print(_memorizingDetail);
              });
            },
          ),
          SizedBox(height: 24),
          Builder(builder: (_) {
            Widget body = (selectedIndex == 0)
                ? Column(
                    children: _kosaKataProvider.vocabullaries
                        .map((vocabullary) => cardWords(
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
                : Column(
                    children: _memorizingDetail.memorizingDetails
                        .map((memorizingDetail) => memorizedCard(
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
