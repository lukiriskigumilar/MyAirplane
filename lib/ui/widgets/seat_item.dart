import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/seat_cubit.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // 0=AVAILABLE 1=SELECTED 2=UNVAILABLE

  final String id;
  final bool isAvailable;
  const SeatItem({
    super.key,
    this.isAvailable = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgrouncolor() {
      if (!isAvailable) {
        return kUnvailableSeat;
      } else {
        if (isSelected) {
          return kprimaryColor;
        } else {
          return kAvailableSeat;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnvailableSeat;
      } else {
        return kprimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            "YOU",
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgrouncolor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor(), width: 2)),
        child: child(),
      ),
    );
  }
}
