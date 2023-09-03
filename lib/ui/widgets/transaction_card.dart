import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/models/transaction_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

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
          // NOTE: DESTINATION TILE
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
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // NOTE: BOOKING DETAILS TEXT
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE: BOOKING DETAILS ITEMS
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveler} person',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
              title: "AirPort Code",
              valueText: transaction.destination.airportCode,
              valueColor: kprimaryColor),
          BookingDetailsItem(
              title: "Airport City",
              valueText: transaction.destination.airportCity,
              valueColor: kprimaryColor),
          BookingDetailsItem(
            title: 'Seat',
            valueText: transaction.selectedSeats,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
              title: "Reservation date",
              valueText:
                  DateFormat.yMMMMd().format(transaction.creationDateTime),
              valueColor: kBlackColor),
          BookingDetailsItem(
            title: 'Insurance',
            valueText: transaction.destination.insurance ? 'YES' : 'NO',
            valueColor:
                transaction.destination.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueText: transaction.destination.refundable ? 'YES' : 'NO',
            valueColor:
                transaction.destination.refundable ? kGreenColor : kRedColor,
          ),

          BookingDetailsItem(
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),

          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.price),
            valueColor: kBlackColor,
          ),

          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
            valueColor: kprimaryColor,
          ),
        ],
      ),
    );
  }
}
