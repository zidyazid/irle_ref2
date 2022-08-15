import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:irle_ref2/pages/home/main_page.dart';
import 'package:irle_ref2/preview/main_preview.dart';
import 'package:irle_ref2/theme.dart';

class OnboardingPage extends StatefulWidget {
  // const OnboardingPage({ Key? key }) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int indexIndicator = 0;

  List image = [
    'assets/onboardingImg1.png',
    'assets/onboardingImg2.png',
    'assets/onboardingImg3.png',
  ];

  List title = [
    'Mudah untuk dipelajari',
    'Belajar lebih interaktif',
    'Waktu belajar yang tidak terikat',
  ];

  List subTitle = [
    'Bersama irle belajar akan menjadi lebih mudah dan menyenangkan',
    'Dengan fitur interaktif yang akan membantu kamu mempelajari bahasa inggris',
    'Kamu bisa belajar dari manapun dan kapanpun yang kamu suka',
  ];

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          width: double.infinity,
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/skip_button.png",
                width: 60,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(48)),
                color: whiteColor,
                image:
                    DecorationImage(image: AssetImage(image[indexIndicator]))),
          )
        ],
      );
    }

    Widget onboardingIndicator() {
      return Container(
        // color: darkGrey,
        padding: EdgeInsets.only(bottom: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              width: indexIndicator == 0 ? 20 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: indexIndicator == 0 ? blueColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: indexIndicator == 1 ? 20 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: indexIndicator == 1 ? blueColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: indexIndicator == 2 ? 20 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: indexIndicator == 2 ? blueColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      );
    }

    Widget customBottomNavBar() {
      return Container(
          // color: Colors.red,
          // margin: EdgeInsets.only(top: 24),
          height: 220,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${title[indexIndicator]}",
                style: titleTextStyle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Text("${subTitle[indexIndicator]}",
                    textAlign: TextAlign.center, style: subTitleTextStyle),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(children: [
                  onboardingIndicator(),
                  // ]),
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          elevation: 5.0,
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      onPressed: () {
                        setState(() {
                          if (indexIndicator < 2) {
                            indexIndicator++;
                          } else {
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/sign-in', (route) => false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MainPreview()));
                          }
                        });
                      },
                      child: Text(
                        "next",
                        style: subTitleTextStyle.copyWith(color: primaryColor),
                      ))
                ],
              )
            ],
          ));
    }

    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: customBottomNavBar(),
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
