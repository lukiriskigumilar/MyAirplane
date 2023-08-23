import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String item;
  const InterestItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_check.png'))),
          ),
          Text(
            item,
            style: blackTextStyle,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
