import 'package:anak_kampus/components/bottom_button.dart';
import 'package:anak_kampus/constant.dart';
import 'package:anak_kampus/pages/occupationpref.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', _googleSignIn.currentUser.email);
      prefs.setString('displayName', _googleSignIn.currentUser.displayName);
      prefs.setString('photoUrl', _googleSignIn.currentUser.photoUrl);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OccupationPreference(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

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
                BottomButton(
                  description: 'Log in',
                  onTap: () async {
                    await _handleSignIn();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
