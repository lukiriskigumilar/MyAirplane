import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../pages/detail_page.dart';

class DestinationCard extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationCard(
      {super.key,
      required this.name,
      required this.city,
      required this.imageUrl,
      this.rating = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 330,
      margin: EdgeInsets.only(left: defaultMargin),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: AssetImage(imageUrl))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2, left: 1),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text(
                        rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: purpleTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style:
                        greyTextStyle.copyWith(fontWeight: light, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
