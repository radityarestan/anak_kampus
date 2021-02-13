import 'package:anak_kampus/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  String displayName = '';
  String email = '';
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
    getUserAttributes();
  }

  void getUserAttributes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString('displayName') ?? 'No Name';
      email = prefs.getString('email') ?? 'No Email';
      photoUrl = prefs.getString('photoUrl') ?? 'No Photo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(displayName),
            ),
            Container(
              child: Text(email),
            ),
            Image.network(
              photoUrl,
              width: 50.0,
              height: 50.0,
            ),
            FlatButton(
              color: Colors.yellow,
              onPressed: () async {
                GoogleSignIn().signOut();
                // SharedPreferences preferences =
                //     await SharedPreferences.getInstance();
                // preferences.remove('email');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
