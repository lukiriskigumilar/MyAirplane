import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomWidgetButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  const CustomWidgetButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,

      //const EdgeInsets.only(
      //top: 35,
      //bottom: 50,
      //),

      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: kprimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            )),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
