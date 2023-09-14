import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myairplane/cubit/topup_history_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/custom_show_history.dart';
import 'package:myairplane/ui/widgets/history_topup_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 50, top: 20),
                    child: Lottie.asset('assets/emptyTransaction.json'),
                  ),
                  Text(
                    "No Transaction Found",
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text('History'),
      ),
      body: showData(),
    );
  }
}
