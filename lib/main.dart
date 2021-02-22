import 'package:anak_kampus/pages/login_page.dart';
import 'package:anak_kampus/pages/occupationpref.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isSignedIn = await GoogleSignIn().isSignedIn();
  print('isSignedIn: $isSignedIn');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: isSignedIn ? OccupationPreference() : LoginPage(),
  ));
}
