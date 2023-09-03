import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/my_qr.dart';
import 'package:myairplane/ui/pages/topUp_page.dart';
import 'package:myairplane/ui/widgets/widgetbutton.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  Widget cardBalance() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/image_card.png')),
                  boxShadow: [
                    BoxShadow(
                      color: kprimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: const Offset(0, 10),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_plane.png'))),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(state.user.balance),
                    style: whiteTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget menuWallet(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Service',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetService(
                imageUrl: 'assets/iconTopup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateBalancePage()),
                  );
                },
              ),
              WidgetService(
                imageUrl: 'assets/iconBarcode.png',
                title: 'Scan to Pay',
                onTap: () {},
              ),
              WidgetService(
                imageUrl: 'assets/sendMoney.png',
                title: 'Transfer',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetService(
                imageUrl: 'assets/iconWd.png',
                title: 'Withdrawal',
                onTap: () {},
              ),
              WidgetService(
                imageUrl: 'assets/iconMyqr.png',
                title: 'My Qr',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyQr()),
                  );
                },
              ),
              WidgetService(
                imageUrl: 'assets/iconHistory.png',
                title: 'History',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [cardBalance(), menuWallet(context)],
      ),
    );
  }
}
