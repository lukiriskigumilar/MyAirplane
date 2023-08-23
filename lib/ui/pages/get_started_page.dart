import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../widgets/custom_widget_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/new_plane.jpg'), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle
                      .copyWith(fontSize: 32, fontWeight: semiBold, shadows: [
                    const Shadow(
                      color: Color(0xff5c40cc),
                      offset: Offset(2.0, 1.0),
                      blurRadius: 1.0,
                    )
                  ]),
                ),
                Text(
                  "Explore new wocrld with us and let\nyourself get an amazing experiences",
                  style: blackTextStyle
                      .copyWith(fontSize: 17, fontWeight: medium, shadows: [
                    const Shadow(
                      color: Colors.white,
                      offset: Offset(1, 1),
                      blurRadius: 1.0,
                    )
                  ]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 400,
                ),
                CustomWidgetButton(
                  title: 'Get Started',
                  width: 220,
                  margin: const EdgeInsets.only(top: 35, bottom: 50),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
