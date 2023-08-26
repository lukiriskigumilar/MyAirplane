import 'package:myairplane/models/destination_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destinations;

  const DestinationTile(
    this.destinations, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(destinations)));
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
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(destinations.imageUrl))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                    overflow:
                        TextOverflow.ellipsis, // supaya text tidak overfow
                  ),
                  Text(
                    destinations.city,
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
                  destinations.rating.toString(),
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
