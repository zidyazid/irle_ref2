import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/providers/auth_provider.dart';
import 'package:irle_ref2/theme.dart';
import 'package:provider/provider.dart';

class HeaderMain extends StatelessWidget {
  // const HeaderMain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String username = box.read('name');
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 6, left: 30, right: 30),
      height: 70,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  (user == null && box.read('id') == null)
                      ? box.read('name')
                      : "Hello! $username",
                  style: titleTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w100)),
              Text("wellcome",
                  style: subTitleTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w100)),
            ],
          ),
          (user == null && box.read('id') == null)
              ? TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  child: Text("Sign In", style: subTitleTextStyle))
              : GestureDetector(
                  onTap: () {
                    box.remove('email');
                    box.remove('name');
                    box.remove('id');
                    box.remove('token');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (Route<dynamic> route) => false);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightRed),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 18,
                      )),
                )
        ],
      ),
    );
  }
}
