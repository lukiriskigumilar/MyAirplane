part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccses extends TransactionState {
  final List<TransactionModel> transaction;
  const TransactionSuccses(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class TransactionFailed extends TransactionState {
  final String error;
  const TransactionFailed(this.error);
  @override
  List<Object> get props => [error];
}
