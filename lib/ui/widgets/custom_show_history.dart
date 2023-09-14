import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/booking_details_item.dart';

class CardHistoryTopup extends StatelessWidget {
  final HistoryTopupMOdel history;
  const CardHistoryTopup(this.history, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kUnvailableSeat,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: BOOKING DETAILS TEXT
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              'Top up',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE: BOOKING DETAILS ITEMS
          BookingDetailsItem(
              title: "Top up date",
              valueText: DateFormat.yMMMMd().format(history.creationDateTime),
              valueColor: kBlackColor),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(history.parseBalance),
            valueColor: kBlackColor,
          ),
        ],
      ),
    );
  }
}
