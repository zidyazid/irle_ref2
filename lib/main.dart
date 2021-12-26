import 'package:flutter/material.dart';
import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/pages/home/main_page.dart';
import 'package:irle_ref2/pages/onboarding_page.dart';
import 'package:irle_ref2/pages/sign_in_page.dart';
import 'package:irle_ref2/pages/sign_up_page.dart';
import 'package:irle_ref2/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // NOTE : ROUTE
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/main-page': (context) => MainPage(),
        '/detail-materi': (context) => DetailMateriPage(),
      },
    );
  }
}
