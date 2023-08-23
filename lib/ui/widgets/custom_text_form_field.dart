import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String tittle;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      required this.tittle,
      required this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tittle),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            obscureText: obscureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(width: 2, color: kGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(width: 3, color: kprimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
