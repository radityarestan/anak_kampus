import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceBox extends StatelessWidget {
  final String choiceDescription;
  final String assetImage;
  final Function onTap;
  final String selectedBackground;
  final bool selectedCheck;

  ChoiceBox(
      {this.choiceDescription,
      this.assetImage,
      this.onTap,
      this.selectedBackground,
      this.selectedCheck});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
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
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFFFB93E),
                ),
                child: Center(
                  child: Visibility(
                    visible: selectedCheck ? true : false,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
