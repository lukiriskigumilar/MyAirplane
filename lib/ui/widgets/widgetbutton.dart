import 'package:flutter/material.dart';
import 'package:myairplane/shared/theme.dart';

class WidgetService extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const WidgetService({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kUnvailableSeat,
                border: Border.all(
                  color: kprimaryColor,
                  width: 2,
                )),
            child: Center(
              child: Image.asset(
                imageUrl,
                width: 26,
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
