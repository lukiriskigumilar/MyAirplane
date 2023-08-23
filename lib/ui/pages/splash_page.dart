import 'dart:async';

import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/get_started');
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
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(bottom: 35),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icon_plane.png'))),
          ),
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
