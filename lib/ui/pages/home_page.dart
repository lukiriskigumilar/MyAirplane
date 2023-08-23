import 'package:myairplane/shared/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/destination_card.dart';
import '../widgets/destination_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            EdgeInsets.only(right: defaultMargin, left: defaultMargin, top: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Howdy, \nKezia Anne ",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Where to fly today?",
                    style:
                        greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            )
          ],
        ),
      );
    }

    Widget popularDestination() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              DestinationCard(
                  name: "Rialto Bridge",
                  city: "Italy,Venice",
                  imageUrl: 'assets/image_destination1.png'),
              DestinationCard(
                name: "White House",
                city: "santorini, greece ",
                imageUrl: "assets/image_destination2.png",
                rating: 5.0,
              ),
              DestinationCard(
                  name: "Three Story Pagoda",
                  city: "Kyoto, Japan",
                  imageUrl: 'assets/image_destination4.png'),
              DestinationCard(
                  name: "Supertree Grove",
                  city: "Singapore",
                  imageUrl: 'assets/image_destination5.png')
            ],
          ),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
            top: 20, left: defaultMargin, right: defaultMargin, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
            const DestinationTile(
                title: "Danau Berantan",
                city: "Singaraja, Indonesia",
                imageUrl: 'assets/image_destination6.png'),
            const DestinationTile(
                title: "Sydney Opera",
                city: "Sydney, Aussie",
                imageUrl: 'assets/image_destination7.png'),
            const DestinationTile(
                title: "Roma",
                city: "Roma, Italy",
                imageUrl: 'assets/image_destination8.png'),
            const DestinationTile(
                title: "SuperTree Grove",
                city: "Singapore",
                imageUrl: 'assets/image_destination9.png'),
            const DestinationTile(
                title: "Roma",
                city: "Roma, Italy",
                imageUrl: 'assets/image_destination8.png'),
          ],
        ),
      );
    }

    return ListView(
      children: [header(), popularDestination(), newDestination()],
    );
  }
}
