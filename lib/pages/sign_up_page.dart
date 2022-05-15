import 'package:flutter/material.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/tap_bounce_container.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpPage extends StatefulWidget {
  // const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var userUsername;
var userPassword;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "Registerasi Berhasil",
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/main-page', (route) => false);
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Registerasi Gagal",
          ),
        );
      }
    }

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
                "Daftar",
                style: titleTextStyle.copyWith(fontSize: 18, color: blueColor),
              ),
              Text(
                "Buat sebuah akun untuk mulai belajar",
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
                controller: nameController,
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
              onPressed: handleSignUp,
              child: Text(
                "Daftar",
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
              inputEmail(),
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
