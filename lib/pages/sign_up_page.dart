import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
// import 'package:irle_ref2/services/auth_service.dart';
import 'package:irle_ref2/theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpPage extends StatefulWidget {
  // const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

TextEditingController fullnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var userUsername;
var userPassword;
var _user = UserModel();
// var _authService = AuthService();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.only(top: 30),
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
                "Sign Up",
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

    Widget inputFullname() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Text("Fullname",
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
                controller: fullnameController,
                decoration: InputDecoration.collapsed(
                  hintText: "Fullname",
                  hintStyle: subTitleTextStyle.copyWith(color: darkGrey),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget inputUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Text("Username",
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
                controller: usernameController,
                decoration: InputDecoration.collapsed(
                  hintText: "username",
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
              onPressed: () {},
              child: Text(
                "Register",
                style:
                    subTitleTextStyle.copyWith(color: whiteColor, fontSize: 16),
              )));
    }

    Widget content() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signUpImage.png"))),
          ),
          Column(
            children: [
              inputFullname(),
              SizedBox(
                height: 12,
              ),
              inputUsername(),
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
            Text("Telah memiliki akun?",
                style: textStyle1.copyWith(color: primaryTextColor)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: Text("Masuk",
                    style: textStyle1.copyWith(color: blueColor))),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: customBottomNavbar(),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        children: [header(), content()],
      ),
    );
  }
}
