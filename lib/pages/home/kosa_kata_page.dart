import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class KosaKataPage extends StatefulWidget {
  // const KosaKataPage({ Key? key }) : super(key: key);

  @override
  _KosaKataPageState createState() => _KosaKataPageState();
}

class _KosaKataPageState extends State<KosaKataPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text("verb 1",
                  style: textStyle1.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                  )),
              SizedBox(
                width: 50,
              ),
              Text("verb 2",
                  style: textStyle1.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                  )),
              SizedBox(
                width: 50,
              ),
              Text("verb 3",
                  style: textStyle1.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                  )),
              SizedBox(
                width: 50,
              ),
              Text("verb ing",
                  style: textStyle1.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                  )),
              SizedBox(
                width: 50,
              ),
              Text("translate",
                  style: textStyle1.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                  ))
            ]),
            SizedBox(height: 12),
            Divider(thickness: 1.0, color: darkGrey, height: 1.0),
            SizedBox(height: 12),
            Row(
              children: [
                Text("sing"),
                SizedBox(
                  width: 70,
                ),
                Text("sang"),
                SizedBox(
                  width: 70,
                ),
                Text("sung"),
                SizedBox(
                  width: 70,
                ),
                Text("singing"),
                SizedBox(
                  width: 70,
                ),
                Text("bernyanyi"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
