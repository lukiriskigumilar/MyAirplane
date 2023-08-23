import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

class SuccsesCheckoutPage extends StatelessWidget {
  const SuccsesCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image_success.png'))),
            ),
            Text(
              'Well Booked 😍',
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you ready to explore the new \nworld of experiences?",
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              textAlign: TextAlign.center,
            ),
            CustomWidgetButton(
              title: "My Bookings",
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main', (Route<dynamic> route) => false);
              },
              width: 220,
              margin: const EdgeInsets.only(top: 50),
            )
          ],
        ),
      ),
    );
  }
}
