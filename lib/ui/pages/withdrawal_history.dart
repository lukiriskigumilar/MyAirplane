import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:myairplane/cubit/wd_cubit.dart';

import 'package:myairplane/models/wd_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/withdrawal_page.dart';

import 'package:myairplane/ui/widgets/history_wd_card.dart';

class WithdrawalHistory extends StatefulWidget {
  const WithdrawalHistory({super.key});

  @override
  State<WithdrawalHistory> createState() => _WithdrawalHistoryState();
}

class _WithdrawalHistoryState extends State<WithdrawalHistory> {
  @override
  void initState() {
    context.read<WdCubit>().fetchWd();
    super.initState();
  }

  Widget showData() {
    return BlocBuilder<WdCubit, WdState>(
      builder: (context, state) {
        if (state is WdLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WdSuccses) {
          List<WdModel> wd = state.wdHistory;

          // Sort transactions by creationDateTime in descending order
          wd.sort((a, b) => b.creationDateTime.compareTo(a.creationDateTime));
          if (state.wdHistory.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 50, top: 20),
                    child: Lottie.asset('assets/emptyTransaction.json'),
                  ),
                  Text(
                    "No Transaction Found",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: ListView.builder(
                  itemCount: state.wdHistory.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  itemBuilder: (context, index) {
                    return HistoryWdCard(
                      state.wdHistory[index],
                    );
                  }),
            );
          }
        }

        return Center(
          child: Text("Transaction page "),
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
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WithdrawalPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  width: 180,
                  height: 50,
                  child: Text(
                    'Withdrawal',
                    style: purpleTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  'History',
                  style: purpleTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text('Withdrawal History'),
      ),
      body: Column(
        children: [
          splitScreen(context), // Add the split screen at the top
          Expanded(
            child: showData(), // Add your data content here
          ),
        ],
      ),
    );
  }
}
