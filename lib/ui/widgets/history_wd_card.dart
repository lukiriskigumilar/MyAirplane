import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/models/wd_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/booking_details_item.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoryWdCard extends StatelessWidget {
  final WdModel wd;
  const HistoryWdCard(this.wd, {super.key});

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
        color: kAvailableSeat,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: BOOKING DETAILS TEXT
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Withdrawal History',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE: BOOKING DETAILS ITEMS

          BookingDetailsItem(
              title: "Date",
              valueText: DateFormat.yMMMMd().format(wd.creationDateTime),
              valueColor: kBlackColor),

          BookingDetailsItem(
              title: "Time",
              valueText: DateFormat.jm().format(wd.creationDateTime),
              valueColor: kBlackColor),

          BookingDetailsItem(
            title: 'Withdrawal Amount',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: '-IDR ',
              decimalDigits: 0,
            ).format(wd.wdAmount),
            valueColor: kRedColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              'Withdrawal Detail',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          Container(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: QrImageView(data: wd.idWd),
                ),
              ],
            ),
          ),
          BookingDetailsItem(
              title: 'Key Id', valueText: wd.idWd, valueColor: kGreenColor),

          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              '* Confidential: Only share your QR and Key ID with authorized cashiers or partner outlets',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
