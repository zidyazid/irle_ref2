import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/pages/home/kosa_kata_page.dart';
import 'package:irle_ref2/pages/home/materi_page.dart';
import 'package:irle_ref2/pages/home/status_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/memorizing_detail_provider.dart';
// import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:irle_ref2/widgets/header_main.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.getDataStatus();
  }

  final box = GetStorage();

  getDataStatus() async {
    //bisa diganti beberapa detik sesuai keinginan
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;
    // print(user.id);
    await Provider.of<StatusProvider>(context, listen: false)
        .getStatuses(box.read('id'));
    await Provider.of<MemorizingDetailProvider>(context, listen: false)
        .getMemorizingDetail(box.read('id'));
    await Provider.of<KosaKataProvider>(context, listen: false).getKosaKata();
  }

  int indexPage = 0;
  // dynamic name = FlutterSession().get('token');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    // box.write('image', user.profilePhotoUrl);
    Widget chatButton() {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        // color: Colors.red,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            (user == null && box.read('id') == null)
                ? Alert(
                        context: context,
                        title: "Sorry!",
                        desc:
                            "Kamu belum bisa mengakses halaman ini sebelum login kedalam aplikasi")
                    .show()
                : Navigator.pushNamed(context, '/chatbot-page');
          },
          child: Image.asset(
            "assets/logo_chatbot.png",
            width: 25,
          ),
        ),
      );
    }

    Widget customBottomNavBar() {
      return BottomNavigationBar(
          currentIndex: indexPage,
          onTap: (value) {
            setState(() {
              indexPage = value;
            });
          },
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Icon(
                    Icons.home_outlined,
                    color: Color(indexPage == 0 ? 0xFFFAEBD7 : 0xFF00FFFF),
                    size: 30,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.list_outlined,
                      color: Color(indexPage == 1 ? 0xFFFAEBD7 : 0xFF00FFFF),
                      size: 30,
                    )),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.score_outlined,
                      color: Color(indexPage == 2 ? 0xFFFAEBD7 : 0xFF00FFFF),
                      size: 30,
                    )),
                label: ''),
          ]);
    }

    Widget body() {
      switch (indexPage) {
        case 0:
          return MateriPage();
          break;
        case 1:
          return KosaKataPage();
          break;
        case 2:
          return StatusPage();
          break;
        default:
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNavBar(),
      floatingActionButton: chatButton(),
      backgroundColor: bgLight,
      body: ListView(
        children: [HeaderMain(), body()],
      ),
    );
  }
}
