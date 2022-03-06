import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/submenu_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubmenuPreview extends StatefulWidget {
  // const SubmenuPreview({ Key? key }) : super(key: key);
  final int id;
  final String judul;
  SubmenuPreview({this.id, this.judul});

  @override
  _SubmenuPreviewState createState() => _SubmenuPreviewState();
}

class _SubmenuPreviewState extends State<SubmenuPreview> {
  getSubmenu() async {
    await Provider.of<SubmenuProvider>(context, listen: false)
        .getSubmenus(widget.id.toString());
  }

  void initState() {
    getSubmenu();
    print(getSubmenu());
    super.initState();
  }

  Widget header() {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text('menu'),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    SubmenuProvider _submenuProvider = Provider.of<SubmenuProvider>(context);
    Widget content(String judul, int id, String penjelasan) {
      return GestureDetector(
        onTap: () {
          print(widget.id);

          Alert(
                  context: context,
                  title: "Sorry!",
                  desc:
                      "Kamu belum bisa mengakses halaman ini sebelum login kedalam aplikasi")
              .show();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1.0),
                      spreadRadius: 0,
                      blurRadius: 11,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(judul,
                        style: subTitleTextStyle.copyWith(color: primaryColor)),
                    Icon(Icons.arrow_right, size: 50, color: primaryColor)
                  ],
                )),
            SizedBox(
              height: 24,
            )
          ],
        ),
      );
    }

    print(_submenuProvider);
    return Scaffold(
        appBar: header(),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            children: _submenuProvider.submenus
                .map((submenu) =>
                    content(submenu.judul, submenu.id, submenu.penjelasan))
                .toList()));
  }
}
