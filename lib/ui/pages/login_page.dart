import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Welcome Back\nLet the Journey Begin Again",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSectionlog() {
      //Form email
      Widget emailInput() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email Address"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: "Your email address ",
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

      //form Password
      Widget passwordInput() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Password"),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: "Your password",
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

      //button
      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius))),
              child: Text(
                "Login",
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              )),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [emailInput(), passwordInput(), submitButton()],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [title(), inputSectionlog()],
          ),
        ));
  }
}
