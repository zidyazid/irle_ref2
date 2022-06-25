import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/submenu_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubmenuPage extends StatefulWidget {
  // const SubmenuPage({ Key? key }) : super(key: key);
  final int id;
  final String judul;
  SubmenuPage({this.id, this.judul});

  @override
  _SubmenuPageState createState() => _SubmenuPageState();
}

class _SubmenuPageState extends State<SubmenuPage> {
  getSubmenu() async {
    await Provider.of<SubmenuProvider>(context, listen: false)
        .getSubmenus(widget.id.toString());
  }

  void initState() {
    getSubmenu();
    print(getSubmenu());
    super.initState();
  }

  final box = GetStorage();

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

          (user == null && box.read('id') == null)
              ? Alert(
                      context: context,
                      title: "Sorry!",
                      desc:
                          "Kamu belum bisa mengakses halaman ini sebelum login kedalam aplikasi")
                  .show()
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailMateriPage(
                            id: id,
                            penjelasan: penjelasan,
                            judul: judul,
                            materiId: widget.id,
                          )));
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
                        style: subTitleTextStyle.copyWith(
                            color: primaryColor, fontSize: 22)),
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
