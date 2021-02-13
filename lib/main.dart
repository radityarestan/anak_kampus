import 'package:anak_kampus/pages/login_page.dart';
import 'package:anak_kampus/pages/prefence_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool signedIn = await GoogleSignIn().isSignedIn();
  print(signedIn);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: signedIn ? PreferencePage() : LoginPage(),
  ));
}
