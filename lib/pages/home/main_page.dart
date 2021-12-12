import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);
  final String username;
  MainPage(this.username);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage = 0;

  Widget chatButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      // color: Colors.red,
      child: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
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
          Text("Hello! ${widget.username}",
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
        return Center(child: Text("halaman materi", style: textStyle1));
        break;
      case 1:
        return Center(child: Text("halaman kosa kata", style: textStyle1));
        break;
      case 2:
        return Center(child: Text("halaman status", style: textStyle1));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
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
