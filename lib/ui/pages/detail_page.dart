import 'package:myairplane/models/destination_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/choose_seat_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/interests_item.dart';
import '../widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destinations;
  const DetailPage(this.destinations, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(destinations.imageUrl))),
      );
    }

    Widget customShadow() {
      return Container(
          width: double.infinity,
          height: 214,
          margin: const EdgeInsets.only(top: 236),
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
                          destinations.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destinations.city,
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
                        destinations.rating.toString(),
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
                    destinations.about,
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
                      children: [
                        PhotoItem(
                          imageUrl: destinations.subImageUrl1,
                        ),
                        PhotoItem(
                          imageUrl: destinations.subImageUrl2,
                        ),
                        PhotoItem(
                          imageUrl: destinations.subImageUrl3,
                        ),
                        PhotoItem(
                          imageUrl: destinations.subImageUrl4,
                        ),
                      ],
                    ),
                  ),
                  // Included
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Included",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      InterestItem(
                        item: 'Hotel',
                      ),
                      InterestItem(item: 'Roundtrip '),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      InterestItem(item: "Travel Vehicle"),
                      InterestItem(item: 'Dining Enroute')
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
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(destinations.price),
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
