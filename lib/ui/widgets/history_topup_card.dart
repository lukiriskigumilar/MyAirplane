import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/models/transaction_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/booking_details_item.dart';

class HistoryCard extends StatelessWidget {
  final HistoryTopupMOdel history;
  const HistoryCard(this.history, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: BOOKING DETAILS TEXT
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Top up History',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE: BOOKING DETAILS ITEMS

          BookingDetailsItem(
              title: "Top up Date",
              valueText: DateFormat.yMMMMd().format(history.creationDateTime),
              valueColor: kBlackColor),

          BookingDetailsItem(
              title: "Top up Time",
              valueText: DateFormat.jm().format(history.creationDateTime),
              valueColor: kBlackColor),

          BookingDetailsItem(
            title: 'Amount top up',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(history.parseBalance),
            valueColor: kGreenColor,
          ),
        ],
      ),
    );
  }
}
