part of 'topup_history_cubit.dart';

sealed class TopupHistoryState extends Equatable {
  const TopupHistoryState();

  @override
  List<Object> get props => [];
}

final class TopupHistoryInitial extends TopupHistoryState {}

final class TopupHistoryLoading extends TopupHistoryState {}

final class TopupHistorySuccses extends TopupHistoryState {
  final List<HistoryTopupMOdel> history;
  const TopupHistorySuccses(this.history);

  @override
  List<Object> get props => [history];
}

final class TopupHistoryFailed extends TopupHistoryState {
  final String error;
  const TopupHistoryFailed(this.error);
  @override
  List<Object> get props => [error];
}
