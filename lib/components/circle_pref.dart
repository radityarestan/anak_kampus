import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CirclePref extends StatelessWidget {
  final String number;

  CirclePref({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xA498EBFF),
      ),
      child: Center(
        child: Text(
          number,
          style: GoogleFonts.mouseMemoirs(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
