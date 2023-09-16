import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import 'package:myairplane/ui/widgets/custom_text_form_field.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import '../../shared/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

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

    Widget SignupText() {
      return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 70,
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: RichText(
                text: TextSpan(
                  text: 'Sign up here',
                  style: purpleTextStyle.copyWith(
                      fontWeight: light, decoration: TextDecoration.underline),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' If you don\'t have an account yet',
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, decoration: TextDecoration.none),
                    ),
                  ],
                ),
              )));
    }

    Widget inputSectionlog() {
      //Form email
      Widget emailInput() {
        return CustomTextFormField(
            tittle: 'Email Addres',
            hintText: "Your Email Addres",
            controller: emailController);
      }

      //form Password
      Widget passwordInput() {
        return CustomTextFormField(
            tittle: "Password",
            hintText: "Your Password",
            obscureText: true,
            controller: passwordController);
      }

      //button
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSucces) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage()),
                (Route<dynamic> route) => false,
              );
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomWidgetButton(
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
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
            children: [title(), inputSectionlog(), SignupText()],
          ),
        ));
  }
}
