import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/cubit/wd_cubit.dart';
import 'package:myairplane/models/wd_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/main_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';

import 'package:myairplane/ui/widgets/history_wd_card.dart';

class SuccsesWd extends StatefulWidget {
  const SuccsesWd({super.key});

  @override
  State<SuccsesWd> createState() => _SuccsesWdState();
}

class _SuccsesWdState extends State<SuccsesWd> {
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
            return ListView.builder(
                itemCount: 1,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                itemBuilder: (context, index) {
                  return HistoryWdCard(
                    state.wdHistory[0],
                  );
                });
          }
        }

        return Center(
          child: Text("Transaction page "),
        );
      },
    );
  }

  Widget button() {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: CustomWidgetButton(
          title: "All set!",
          width: 200,
          onPressed: () {
            context.read<PageCubit>().setPage(2);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const MainPage()),
              (Route<dynamic> route) => false,
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: showData(), // Add your data content here
          ),
          button(),
        ],
      ),
    );
  }
}
