import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/pages/chabot_page.dart';
// import 'package:irle_ref2/pages/detail_materi_page.dart';
import 'package:irle_ref2/pages/home/main_page.dart';
import 'package:irle_ref2/pages/onboarding_page.dart';
import 'package:irle_ref2/pages/sign_in_page.dart';
import 'package:irle_ref2/pages/sign_up_page.dart';
import 'package:irle_ref2/pages/splash_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/providers/kosa_kata_provider.dart';
import 'package:irle_ref2/providers/kuis_provider.dart';
import 'package:irle_ref2/providers/materi_provider.dart';
import 'package:irle_ref2/providers/memorizing_detail_provider.dart';
import 'package:irle_ref2/providers/status_provider.dart';
import 'package:irle_ref2/providers/submenu_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MateriProvider()),
        ChangeNotifierProvider(create: (context) => KuisProvider()),
        ChangeNotifierProvider(create: (context) => KosaKataProvider()),
        ChangeNotifierProvider(create: (context) => MemorizingDetailProvider()),
        ChangeNotifierProvider(create: (context) => StatusProvider()),
        ChangeNotifierProvider(create: (context) => SubmenuProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // NOTE : ROUTE
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main-page': (context) => MainPage(),
          '/chatbot-page': (context) => ChabotPage(title: "Chatbot"),
          // '/detail-materi': (context) => DetailMateriPage(),
        },
      ),
    );
  }
}
