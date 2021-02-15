import 'package:anak_kampus/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String description;
  final Function onTap;

  BottomButton({this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.6,
      height: width * 0.12,
      decoration: BoxDecoration(
        color: Color(0xFFA498EB),
        borderRadius: BorderRadius.circular(width * 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(width * 0.3),
        color: Color(0xFFA498EB),
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.3),
          splashColor: Color(0xDDA498EB),
          onTap: onTap,
          child: Center(
            child: Text(
              description,
              style: kLoginHeadline,
            ),
          ),
        ),
      ),
    );
  }
}
