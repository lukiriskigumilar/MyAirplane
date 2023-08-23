import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_widget_button.dart';
import 'login_page.dart';
import 'bonus_page.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get \nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      // Form Input Name

      Widget nameInput() {
        return const CustomTextFormField(
            tittle: "Full Name", hintText: "Your Full Name");
      }

      Widget emailInput() {
        return const CustomTextFormField(
          tittle: "Email Addres",
          hintText: "Your Email Addres",
        );
      }

      Widget passwordInput() {
        return const CustomTextFormField(
          tittle: "Password",
          hintText: "Your Password",
          obscureText: true,
        );
      }

      Widget hobbyInput() {
        return const CustomTextFormField(
            tittle: "Hobby", hintText: "Yout Hobby");
      }

      // w
      Widget submitButton() {
        return CustomWidgetButton(
          title: 'Get Started',
          onPressed: () {
            Navigator.pushNamed(context, '/bonus');
          },
        );
      }

      Widget loginText() {
        return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 70,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Just login',
                    style: purpleTextStyle.copyWith(
                        fontWeight: light,
                        decoration: TextDecoration.underline),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' If you already have an account',
                        style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                )));
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
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
            loginText()
          ],
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
            children: [
              title(),
              inputSection(),
            ],
          ),
        ));
  }
}
