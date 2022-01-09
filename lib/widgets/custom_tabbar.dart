import 'package:flutter/material.dart';
import 'package:irle_ref2/theme.dart';

class CustomTabBar extends StatelessWidget {
  // untuk menentukan tab yang dipilih
  final int selectedIndex;
  // untuk menentukan judul pada setiap tab
  final List<String> titles;
  // fungsi untuk mengirim index yang dipilih
  final Function(int) onTap;

  // constructor dengan parameter yang akan dikirim kan pada saat class dipanggil di halaman utama
  CustomTabBar({this.selectedIndex, @required this.titles, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            width: double.infinity,
            color: whiteColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  elevation:
                                      (titles.indexOf(e) == selectedIndex)
                                          ? 20.0
                                          : 0.0,
                                  backgroundColor:
                                      (titles.indexOf(e) == selectedIndex)
                                          ? whiteColor
                                          : Colors.black12),
                              onPressed: () {
                                if (onTap != null) {
                                  // cek titles
                                  onTap(titles.indexOf(e));
                                }
                              },
                              child: Text(
                                e,
                                style: (titles.indexOf(e) == selectedIndex)
                                    ? textStyle1.copyWith(
                                        color: blueColor,
                                        fontWeight: FontWeight.w500)
                                    : textStyle1.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                          // GestureDetector(
                          //   onTap: () {
                          //     // jika ontap tidak = null maka tampilkan tampilan sesuai dengan index yang di tap

                          //   },
                          //   child: Text(
                          //     e,
                          //     style: (titles.indexOf(e) == selectedIndex)
                          //         ? textStyle1.copyWith(
                          //             color: blueColor,
                          //             fontWeight: FontWeight.w500)
                          //         : textStyle1,
                          //   ),
                          // ),
                          // Container(
                          //   width: 40,
                          //   height: 3,
                          //   margin: EdgeInsets.only(top: 13),
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(1.5),
                          //       // beri kondisi bila index pada title sama dengan index yang dipilih maka muncul kan garis bawah
                          //       color: (titles.indexOf(e) == selectedIndex)
                          //           ? darkGrey
                          //           : Colors.transparent),
                          // )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
