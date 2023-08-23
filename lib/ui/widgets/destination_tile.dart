import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String title;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationTile(
      {super.key,
      required this.title,
      required this.city,
      required this.imageUrl,
      this.rating = 4.5});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(18), // membuat gambar circle
                  image: DecorationImage(image: AssetImage(imageUrl))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                    overflow:
                        TextOverflow.ellipsis, // supaya text tidak overfow
                  ),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.only(right: 2, left: 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'))),
                ),
                Text(
                  rating.toString(),
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
