import 'package:myairplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CustomBottomNavigationItem({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    //print
    int stateValue = context.watch<PageCubit>().state;
    // ignore: avoid_print
    print('$stateValue');
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(imageUrl,
              width: 24,
              height: 24,
              color: context.read<PageCubit>().state == index
                  ? kprimaryColor
                  : kGreyColor),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? kprimaryColor
                    : KtransparentColor,
                borderRadius: BorderRadius.circular(18)),
          )
        ],
      ),
    );
  }
}
