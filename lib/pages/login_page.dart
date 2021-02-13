import 'package:anak_kampus/components/login_button.dart';
import 'package:anak_kampus/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('images/Cover Login.png'),
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hai Anak Kampus!',
                  style: kLoginHeadline,
                ),
                Text(
                  'Temukan pengalaman menarik dari mahasiswa di Indonesia agar kamu lebih mengenal kampus impian nantinya!',
                  textAlign: TextAlign.center,
                  style: kLoginDescription,
                ),
                SizedBox(
                  height: 10.0,
                ),
                LoginButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
