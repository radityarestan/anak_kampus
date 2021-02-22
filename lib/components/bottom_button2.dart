import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomButton2 extends StatelessWidget {
  final Function onTap;

  BottomButton2({this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.3,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pilih',
                style: GoogleFonts.montserratAlternates(
                  textStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
