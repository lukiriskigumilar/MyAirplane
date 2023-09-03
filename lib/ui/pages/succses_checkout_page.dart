import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/get_started_page.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccsesCheckoutPage extends StatefulWidget {
  const SuccsesCheckoutPage({super.key});

  @override
  State<SuccsesCheckoutPage> createState() => _SuccsesCheckoutPageState();
}

class _SuccsesCheckoutPageState extends State<SuccsesCheckoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        context.read<PageCubit>().setPage(1);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const GetStartedPage()),
          (Route<dynamic> route) => false,
        );
      } else {
        // ignore: avoid_print
        print(user.email);
        context.read<PageCubit>().setPage(1);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const MainPage()),
          (Route<dynamic> route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              height: 300,
              margin: const EdgeInsets.only(bottom: 50, top: 20),
              child: Lottie.asset('assets/succses.json'),
            ),
            Text(
              "Hooray! \nYour Payment Was Successful 🥳",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Just a moment, please! We're preparing to guide you to the booking page",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
