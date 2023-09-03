import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myairplane/cubit/transaction_cubit.dart';
import 'package:myairplane/models/transaction_model.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/widgets/transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccses) {
          List<TransactionModel> transactions = state.transaction;

          // Sort transactions by creationDateTime in descending order
          transactions
              .sort((a, b) => b.creationDateTime.compareTo(a.creationDateTime));
          if (state.transaction.isEmpty) {
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
                    "No Order History",
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
                  itemCount: state.transaction.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      state.transaction[index],
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
}
