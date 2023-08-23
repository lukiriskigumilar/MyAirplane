import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // 0=AVAILABLE 1=SELECTED 2=UNVAILABLE

  final int status;

  const SeatItem({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    backgrouncolor() {
      switch (status) {
        case 0:
          return kAvailableSeat;
        case 1:
          return kprimaryColor;
        case 2:
          return kUnvailableSeat;
        default:
          return kUnvailableSeat;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return kprimaryColor;
        case 1:
          return kprimaryColor;
        case 2:
          return kUnvailableSeat;
        default:
          return kUnvailableSeat;
      }
    }

    child() {
      switch (status) {
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              "YOU",
              style: whiteTextStyle.copyWith(fontWeight: semiBold),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: backgrouncolor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor(), width: 2)),
      child: child(),
    );
  }
}
