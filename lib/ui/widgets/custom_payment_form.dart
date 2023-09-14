import 'package:flutter/material.dart';
import 'package:myairplane/shared/theme.dart';

class CustomPayForm extends StatelessWidget {
  final String namePayment;
  final String icon;
  final String hintText;
  final bool isFocused;
  const CustomPayForm(
      {required this.namePayment,
      required this.icon,
      required this.hintText,
      this.isFocused = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            namePayment,
            style: purpleTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          const SizedBox(
            height: 6,
          ),
          Stack(
            alignment: Alignment.centerRight, // Adjust alignment as needed
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                obscureText: false,
                cursorColor: kBlackColor,
                //  controller: _visaMethod,
                decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(width: 2, color: kGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(width: 3, color: kprimaryColor),
                  ),
                ),
              ),
              Positioned(
                right: 8, // Adjust this value to position the logo as needed
                child: Image.asset(
                  icon, // Replace with your logo image asset path
                  width: 40, // Adjust the width as needed
                  height: 40, // Adjust the height as needed
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Add spacing between fields
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2, // Adjust the flex ratio as needed
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  cursorColor: kBlackColor,
                  //  controller: _expirationDateController, // Use your controller
                  decoration: InputDecoration(
                    hintText: "Expiration Date (MM/YY)",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(width: 2, color: kGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(width: 3, color: kprimaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  width: 10), // Add spacing between expiration date and CCV
              Expanded(
                flex: 1, // Adjust the flex ratio as needed
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  cursorColor: kBlackColor,
                  maxLength: 3,
                  //controller: _ccvController, // Use your controller
                  decoration: InputDecoration(
                    hintText: isFocused ? '___' : 'CCV',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(width: 2, color: kGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(width: 3, color: kprimaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
