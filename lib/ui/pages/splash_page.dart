import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/services/auth_services.dart';
import 'package:myairplane/ui/pages/get_started_page.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const GetStartedPage()),
          (Route<dynamic> route) => false,
        );
      } else {
        // ignore: avoid_print
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
      backgroundColor: kprimaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 400,
              height: 400,
              margin: const EdgeInsets.only(bottom: 35),
              child: Lottie.asset('assets/forSplash.json')),
          Text(
            'AIR FLY COUNTRY',
            style: whiteTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            "Fly To Feel at The Top of The World",
            style: whiteTextStyle,
          )
        ],
      )),
    );
  }
}
