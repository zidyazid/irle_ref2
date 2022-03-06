import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
// import 'package:irle_ref2/pages/home/main_page.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
// import 'package:irle_ref2/providers/status_provider.dart';
// import 'package:irle_ref2/services/auth_service.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignInPage extends StatefulWidget {
  // const SignInPage({ Key? key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

var userUsername;
var userPassword;
var _user = UserModel();
// var _authService = AuthService();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // StatusProvider statusProvider = Provider.of<StatusProvider>(context);

    handleSignIn() async {
      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        // statusProvider.getStatuses();
        Navigator.pushNamed(context, '/main-page');
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Login Gagal",
          ),
        );
      }
    }

    Widget header() {
      return Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.topRight,
        //         colors: <Color>[primaryColor, sekunderColor])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: titleTextStyle.copyWith(fontSize: 18, color: blueColor),
              ),
              Text(
                "Create an account to start learning",
                style: subTitleTextStyle.copyWith(color: darkGrey),
              ),
            ],
          ),
        ),
      );
    }

    Widget inputEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Text("Email",
                  style: subTitleTextStyle.copyWith(color: darkGrey))),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: darkGrey),
                borderRadius: BorderRadius.circular(24)),
            child: Center(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration.collapsed(
                  hintText: "Email",
                  hintStyle: subTitleTextStyle.copyWith(color: darkGrey),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget inputPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Text("Password",
                  style: subTitleTextStyle.copyWith(color: darkGrey))),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: darkGrey),
                borderRadius: BorderRadius.circular(24)),
            child: Center(
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration.collapsed(
                  hintText: "Password",
                  hintStyle: subTitleTextStyle.copyWith(color: darkGrey),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget signInButton() {
      return Container(
        width: double.infinity,
        color: whiteColor,
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3,
                    vertical: 15),
                elevation: 5.0,
                backgroundColor: blueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            onPressed: handleSignIn,
            child: Text(
              "Sign In",
              style:
                  subTitleTextStyle.copyWith(color: whiteColor, fontSize: 16),
            )),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signInImage.png"))),
          ),
          Column(
            children: [
              inputEmail(),
              SizedBox(
                height: 12,
              ),
              inputPassword(),
              SizedBox(
                height: 24,
              ),
              signInButton()
            ],
          )
        ],
      );
    }

    Widget customBottomNavbar() {
      return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Belum memiliki akun?",
                style: textStyle1.copyWith(color: primaryTextColor)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text("Daftar Sekarang",
                    style: textStyle1.copyWith(color: blueColor))),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: customBottomNavbar(),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [header(), content()],
      ),
    );
  }
}
