// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/choose_payment.dart';
import 'package:myairplane/ui/pages/topup_history.dart';

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

  Widget selectPayButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var iduser = 'state.user.id';
        // ignore: unnecessary_type_check
        if (state is AuthSucces) {
          iduser = state.user.id;
        }

        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CustomWidgetButton(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                title: "Select Payment",
                onPressed: () {
                  var idUser = state.user.id;
                  int userBalancenow = state.user.balance;
                  var checkbalance = _amountController.text;

                  if (checkbalance.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kRedColor,
                      content: const Text(
                          "Please ensure the top-up amount is provided"),
                    ));
                  } else {
                    int parseBalance = int.parse(checkbalance);
                    int newBalance = parseBalance + userBalancenow;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosePayment(
                                  HistoryTopupMOdel(
                                      creationDateTime: DateTime.now(),
                                      id: iduser,
                                      parseBalance: parseBalance),
                                  iduser: idUser,
                                  newBalance: newBalance,
                                )));
                  }
                });
          },
        );
      },
    );
  }

  Widget splitScreen(context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      height: 50,
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                color: kAvailableSeat,
                width: 180,
                height: 50,
                child: Text(
                  'Top up',
                  style: purpleTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopupHistory()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  width: 180,
                  height: 50,
                  child: Text(
                    'History',
                    style: purpleTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: splitScreen(context),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  card(),
                  nameInput(),
                  const SizedBox(height: 20),
                  selectPayButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
