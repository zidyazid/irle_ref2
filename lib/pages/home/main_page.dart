import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/pages/home/kosa_kata_page.dart';
import 'package:irle_ref2/pages/home/materi_page.dart';
import 'package:irle_ref2/pages/home/status_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

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

  getDataStatus() async {
    //bisa diganti beberapa detik sesuai keinginan
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    // print(user.id);
    await Provider.of<StatusProvider>(context, listen: false)
        .getStatuses(user.id);
  }

  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget chatButton() {
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        // color: Colors.red,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/chatbot-page');
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

    Widget header() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 6, left: 30),
        height: 70,
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello! ${user.name}",
                style: titleTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w100)),
            Text("wellcome",
                style: subTitleTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w100)),
          ],
        ),
      );
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
        children: [header(), body()],
      ),
    );
  }
}
