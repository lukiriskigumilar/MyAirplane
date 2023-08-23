import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/choose_seat_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

import '../widgets/interests_item.dart';
import '../widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_destination1.png'))),
      );
    }

    Widget customShadow() {
      return Container(
          width: double.infinity,
          height: 214,
          margin: EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.94)
              ])));
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            //emblem
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_emblem.png'))),
            ),
            //Title
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rialto Bridge",
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Italy, Venice",
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2, left: 0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text(
                        '4,5',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //Description
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadiusDirectional.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //About
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "The present stone bridge, a single span designed by Antonio da Ponte, began to be constructed in 1588 and was completed in 1591. It is similar to the wooden bridge it succeeded. Two ramps lead up to a central portico. On either side of the portico, the covered ramps carry rows of shops.",
                    style: blackTextStyle.copyWith(
                      height: 1.5,
                    ),
                  ),
                  //Photos
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        PhotoItem(
                          imageUrl: 'assets/image_photo1.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo2.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_photo3.png',
                        ),
                        PhotoItem(
                          imageUrl: 'assets/image_destination1.png',
                        ),
                      ],
                    ),
                  ),
                  // Interests
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Interest",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: const [
                      InterestItem(
                        item: 'Kids Park',
                      ),
                      InterestItem(item: 'City Museum'),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: const [
                      InterestItem(item: 'Honor Bridge'),
                      InterestItem(item: 'Central Mall')
                    ],
                  )
                ],
              ),
            ),
            //Price and book button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Row(
                children: [
                  //Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IDR 2.500.000",
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Per Person',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  // Booking button
                  CustomWidgetButton(
                    title: 'Booking Now',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseSeatPage()));
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [backgroundImage(), customShadow(), content()],
          ),
        ));
  }
}
