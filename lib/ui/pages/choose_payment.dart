// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/topup_history_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/succses_topup.dart';
import 'package:myairplane/ui/widgets/custom_payment_form.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';

class ChoosePayment extends StatelessWidget {
  final HistoryTopupMOdel topup;
  final iduser;
  final newBalance;

  const ChoosePayment(
    this.topup, {
    super.key,
    this.iduser,
    this.newBalance,
  });

  Widget visaMethod() {
    return const Column(
      children: [
        CustomPayForm(
            namePayment: 'VISA',
            icon: 'assets/visa_icon.png',
            hintText: '16 Digit Visa Card Number'),
        SizedBox(
          height: 10,
        ),
        CustomPayForm(
            namePayment: "Master Card",
            icon: 'assets/masterCard_icon.png',
            hintText: '16 Digit MasterCard Card Number')
      ],
    );
  }

  Widget payNow(BuildContext context) {
    return CustomWidgetButton(
        title: "Pay Now",
        onPressed: () {
          context.read<TopupHistoryCubit>().createHistory(topup);
          context.read<AuthCubit>().updateBalance(iduser, newBalance);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const SuccsesTopupPage()),
            (Route<dynamic> route) => false,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text('Select Payment Method'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              visaMethod(),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 20),
              payNow(context)
            ],
          ),
        ),
      ),
    );
  }
}
