// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/wallet_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';

class UpdateBalancePage extends StatefulWidget {
  const UpdateBalancePage({super.key});

  @override
  _UpdateBalancePageState createState() => _UpdateBalancePageState();
}

class _UpdateBalancePageState extends State<UpdateBalancePage> {
  final TextEditingController _amountController =
      TextEditingController(text: '');

  Widget nameInput() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Up Amount',
              style:
                  purpleTextStyle.copyWith(fontSize: 20, fontWeight: medium)),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            keyboardType:
                TextInputType.number, // Set the keyboard type to number
            obscureText: false,
            cursorColor: kBlackColor,
            controller: _amountController,
            decoration: InputDecoration(
              hintText: "IDR",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(width: 2, color: kGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(width: 3, color: kprimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSucces) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const WalletPage()),
            (Route<dynamic> route) => false,
          );
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: kRedColor,
            content: Text(state.error),
          ));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomWidgetButton(
          title: 'Chosee Payment',
          onPressed: () async {
            var userId = await state.user.id;
            int nowBalance = state.user.balance;
            var checkbalance = _amountController.text;
            // ignore: unrelated_type_equality_checks
            if (checkbalance.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor,
                content:
                    const Text("Please ensure the top-up amount is provided"),
              ));
            } else {
              int plusBalance = int.parse(checkbalance);
              int newBalance = plusBalance + nowBalance;
              context.read<AuthCubit>().updateBalance(userId, newBalance);
              Navigator.pop(context); // Return to previous page
            }
          },
        );
      },
    );
  }

  Widget card() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image_card.png'))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: const EdgeInsets.only(right: 6),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icon_plane.png'))),
                              ),
                              Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Current Balance",
                              style: greyTextStyle.copyWith(fontWeight: light),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text('Top Up Balance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              card(),
              const SizedBox(
                height: 80,
              ),
              nameInput(),
              const SizedBox(height: 20),
              submitButton()

              // ElevatedButton(
              //   onPressed: () async {
              //     var userId = await getCurrentUserId();
              //     int newBalance = _amountController;
              //     context.read<AuthCubit>().updateBalance(userId, newBalance);
              //     Navigator.pop(context); // Return to previous page
              //   },
              //   child: const Text('Update Balance'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
