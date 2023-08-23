// ignore_for_file: sized_box_for_whitespace

import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/succses_checkout_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

import '../widgets/booking_details_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Tanggerang",
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VCE",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Venice",
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        //Destination Tile
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image_destination1.png'))),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rialto Bridge",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                        overflow:
                            TextOverflow.ellipsis, // supaya text tidak overfow
                      ),
                      Text(
                        "Italy, Venice",
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
                      "3.5",
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            // Booking Details Text
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Booking Details",
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
            ),
            // Booking detail Items
            BookingDetailsItem(
                title: "Traveler",
                valueText: "2 Person",
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Seat", valueText: "A3, B3", valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Insurance", valueText: "YES", valueColor: kGreenColor),
            BookingDetailsItem(
                title: "Refundable", valueText: "NO", valueColor: kRedColor),
            BookingDetailsItem(
                title: "Price",
                valueText: "IDR 8.500.690",
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Grand Total",
                valueText: "IDR 12.000.000",
                valueColor: kprimaryColor),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Details",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image_card.png'))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/icon_plane.png'))),
                          ),
                          Text(
                            "Pay",
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IDR 80.400.000",
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Current Balance",
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget payNowButton() {
      return CustomWidgetButton(
        title: "Pay Now ",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SuccsesCheckoutPage()));
        },
        margin: const EdgeInsets.only(top: 30),
      );
    }

    Widget termsAndConditions() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 30, bottom: 20),
        child: Text(
          "Terms and Conditions",
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          termsAndConditions()
        ],
      ),
    );
  }
}
