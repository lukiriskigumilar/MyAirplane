import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myairplane/cubit/topup_history_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/succses_topup.dart';
import 'package:myairplane/ui/pages/topUp_page.dart';
import 'package:myairplane/ui/widgets/history_topup_card.dart';

class TopupHistory extends StatefulWidget {
  const TopupHistory({super.key});

  @override
  State<TopupHistory> createState() => _TopupHistoryState();
}

class _TopupHistoryState extends State<TopupHistory> {
  @override
  void initState() {
    context.read<TopupHistoryCubit>().fetchtopup();
    super.initState();
  }

  Widget showData() {
    return BlocBuilder<TopupHistoryCubit, TopupHistoryState>(
      builder: (context, state) {
        if (state is TopupHistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopupHistorySuccses) {
          List<HistoryTopupMOdel> history = state.history;

          // Sort transactions by creationDateTime in descending order
          history
              .sort((a, b) => b.creationDateTime.compareTo(a.creationDateTime));
          if (state.history.isEmpty) {
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
                    "No Top up History Found",
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
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
                  itemCount: state.history.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  itemBuilder: (context, index) {
                    return HistoryCard(
                      state.history[index],
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
                    MaterialPageRoute(
                        builder: (context) => const UpdateBalancePage()),
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
                    'Top up',
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
        title: const Text('Top up History'),
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
