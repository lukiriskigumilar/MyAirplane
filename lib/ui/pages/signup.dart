import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/ui/pages/bonus_page.dart';
import '../../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_widget_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
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
        return CustomTextFormField(
          tittle: "Full Name",
          hintText: "Your Full Name",
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          tittle: "Email Addres",
          hintText: "Your Email Addres",
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          tittle: "Password",
          hintText: "Your Password",
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget hobbyInput() {
        return CustomTextFormField(
          tittle: "Hobby",
          hintText: "Yout Hobby,",
          controller: hobbyController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSucces) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const BonusPage()),
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
              title: 'Get Started',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text);
              },
            );
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
