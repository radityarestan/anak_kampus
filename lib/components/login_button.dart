import 'package:anak_kampus/constant.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onTap;

  LoginButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.6,
      height: width * 0.12,
      decoration: BoxDecoration(
        color: Color(0xA498EBFF),
        borderRadius: BorderRadius.circular(width * 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 3.0,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(width * 0.3),
        color: Color(0xA498EBFF),
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.3),
          splashColor: Color(0xA498EBEE),
          onTap: onTap,
          child: Center(
            child: Text(
              'Log in',
              style: kLoginHeadline,
            ),
          ),
        ),
      ),
    );
  }
}
