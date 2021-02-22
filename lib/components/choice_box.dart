import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceBox extends StatelessWidget {
  final String choiceDescription;
  final String assetImage;
  final String selectedBackground;
  final bool selectedCheck;

  ChoiceBox(
      {this.choiceDescription,
      this.assetImage,
      this.selectedBackground,
      this.selectedCheck});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Opacity(
      opacity: selectedBackground == 'null'
          ? 1
          : selectedBackground == 'true'
              ? 1
              : 0.2,
      child: Container(
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(width * 0.05),
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              choiceDescription,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(
              image: AssetImage(assetImage),
            ),
          ],
        ),
      ),
    );
  }
}
