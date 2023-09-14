// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/transaction_cubit.dart';
import 'package:myairplane/models/transaction_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/succses_checkout_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';
import 'package:flutter/material.dart';

import '../widgets/booking_details_item.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      transaction.destination.airportCode,
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      transaction.destination.airportCity,
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
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(transaction.destination.imageUrl))),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                        overflow:
                            TextOverflow.ellipsis, // supaya text tidak overfow
                      ),
                      Text(
                        transaction.destination.city,
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
                      transaction.destination.rating.toString(),
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
                valueText: "${transaction.amountOfTraveler} Person",
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Seat",
                valueText: transaction.selectedSeats,
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Insurance",
                valueText: transaction.destination.insurance ? 'YES' : 'NO',
                valueColor: transaction.destination.insurance
                    ? kGreenColor
                    : kRedColor),
            BookingDetailsItem(
                title: "Refundable",
                valueText: transaction.destination.refundable ? 'YES' : 'NO',
                valueColor: transaction.destination.refundable
                    ? kGreenColor
                    : kRedColor),
            BookingDetailsItem(
                title: "VAT",
                valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Price",
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.price),
                valueColor: kBlackColor),
            BookingDetailsItem(
                title: "Grand Total",
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.grandTotal),
                valueColor: kprimaryColor),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
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
                                          image: AssetImage(
                                              'assets/icon_plane.png'))),
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
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
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
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
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
          return const SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          int compareSaldo = 0;
          var iduser = '';
          if (state is AuthSucces) {
            compareSaldo = state.user.balance;
            iduser = state.user.id;
          }
          return BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              int newBalance = 0;
              newBalance = compareSaldo - transaction.grandTotal;
              var id = '';
              id = iduser;
              if (compareSaldo >= transaction.grandTotal) {
                if (state is TransactionSuccses) {
                  // Memperbarui balance di Firebase
                  var collection =
                      FirebaseFirestore.instance.collection('users');
                  collection
                      .doc(id) // <-- Doc ID where data should be updated.
                      .update({'balance': newBalance});

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SuccsesCheckoutPage()),
                    (Route<dynamic> route) => false,
                  );
                } else if (state is TransactionFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.error),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: kRedColor,
                  content:
                      const Text("Your balance isn't enough for this purchase"),
                ));
              }
            },
            builder: (context, state) {
              if (state is TransactionLoading) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 30),
                  child: const CircularProgressIndicator(),
                );
              }
              return CustomWidgetButton(
                title: "Pay Now ",
                onPressed: () {
                  if (compareSaldo >= transaction.grandTotal) {
                    return context
                        .read<TransactionCubit>()
                        .createTransaction(transaction);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kRedColor,
                      content: const Text(
                          "Your balance isn't enough for this purchase"),
                    ));
                  }
                },
                margin: const EdgeInsets.only(top: 30),
              );
            },
          );
        },
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
