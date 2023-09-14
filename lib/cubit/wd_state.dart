part of 'wd_cubit.dart';

sealed class WdState extends Equatable {
  const WdState();

  @override
  List<Object> get props => [];
}

final class WdInitial extends WdState {}

class WdLoading extends WdState {}

class WdSuccses extends WdState {
  final List<WdModel> wdHistory;
  const WdSuccses(this.wdHistory);

  @override
  List<Object> get props => [wdHistory];
}

class WdFailed extends WdState {
  final String error;
  const WdFailed(this.error);
  @override
  List<Object> get props => [error];
}
