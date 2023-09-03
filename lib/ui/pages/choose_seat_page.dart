// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/seat_cubit.dart';
import 'package:myairplane/models/destination_model.dart';
import 'package:myairplane/models/transaction_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/checkout_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

import '../widgets/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel wisata;
  const ChooseSeatPage(this.wisata, {super.key});

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
            Text("Available", style: blackTextStyle),

            //Selected
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_selected.png'))),
            ),
            Text("Selected", style: blackTextStyle),
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
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                        id: 'A1',
                        isAvailable: false,
                      ),
                      const SeatItem(
                        id: 'B1',
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
                        id: 'C1',
                      ),
                      const SeatItem(
                        id: 'D1',
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
                        id: 'A2',
                      ),
                      const SeatItem(
                        id: 'B2',
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
                        id: 'C2',
                      ),
                      const SeatItem(
                        id: 'D2',
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
                        id: 'A3',
                      ),
                      const SeatItem(
                        id: 'B3',
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
                        id: 'C3',
                      ),
                      const SeatItem(
                        id: 'D3',
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
                        id: 'A4',
                      ),
                      const SeatItem(
                        id: 'B4',
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
                        id: 'C4',
                      ),
                      const SeatItem(
                        id: 'D4',
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
                        id: 'A5',
                      ),
                      const SeatItem(
                        id: 'B5',
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
                        id: 'C5',
                      ),
                      const SeatItem(
                        id: 'D5',
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
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                      Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(state.length * wisata.price),
                          style: purpleTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var iduser = 'state.user.id';
          // ignore: unnecessary_type_check
          if (state is AuthSucces) {
            iduser = state.user.id;
          }

          return BlocBuilder<SeatCubit, List<String>>(
            builder: (context, state) {
              return CustomWidgetButton(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  title: "Continue to Checkout",
                  onPressed: () {
                    int price = wisata.price * state.length;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(TransactionModel(
                                  creationDateTime: DateTime.now(),
                                  id: iduser,
                                  destination: wisata,
                                  amountOfTraveler: state.length,
                                  selectedSeats: state.join(', '),
                                  vat: 0.45,
                                  price: price,
                                  grandTotal: price + (price * 0.45).toInt(),
                                ))));
                  });
            },
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [title(), seatStatus(), selectSeat(), checkOutButton()],
        ));
  }
}
