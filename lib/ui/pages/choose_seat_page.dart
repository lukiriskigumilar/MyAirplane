// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/checkout_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

import '../widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            //Available Seat
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_available.png'))),
            ),
            Text("Selected", style: blackTextStyle),

            //Selected
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_selected.png'))),
            ),
            Text("Available", style: blackTextStyle),
            //Unavailable
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_unavailable.png'))),
            ),
            Text("Unavailable", style: blackTextStyle)
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          children: [
            // Seat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "A",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "B",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "C",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
                Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        "D",
                        style: greyTextStyle.copyWith(fontSize: 16),
                      ),
                    )),
              ],
            ),
            // SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: 2,
                  ),
                  const SeatItem(
                    status: 2,
                  ),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "1",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 2,
                  ),
                ],
              ),
            ),

            // SEAT 2
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 0,
                  ),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "2",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 2,
                  ),
                ],
              ),
            ),

            // SEAT 3
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: 1,
                  ),
                  const SeatItem(
                    status: 1,
                  ),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "3",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 0,
                  ),
                ],
              ),
            ),

            // SEAT 4
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 2,
                  ),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "4",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 0,
                  ),
                ],
              ),
            ),
            // SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: 0,
                  ),
                  const SeatItem(
                    status: 0,
                  ),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "5",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  const SeatItem(
                    status: 2,
                  ),
                  const SeatItem(
                    status: 0,
                  ),
                ],
              ),
            ),
            //Seat info or Your Seat
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Seat",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    " A3 B3",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )
                ],
              ),
            ),

            //BILL Total
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                  Text("IDR 540.000.000",
                      style: purpleTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold))
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return CustomWidgetButton(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          title: "Continue to Checkout",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()));
          });
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [title(), seatStatus(), selectSeat(), checkOutButton()],
        ));
  }
}
