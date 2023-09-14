import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/services/topupHistory_service.dart';

part 'topup_history_state.dart';

class TopupHistoryCubit extends Cubit<TopupHistoryState> {
  TopupHistoryCubit() : super(TopupHistoryInitial());

  void createHistory(HistoryTopupMOdel history) async {
    try {
      emit(TopupHistoryLoading());
      await HistoryService().createHistory(history);
      emit(const TopupHistorySuccses([]));
    } catch (e) {
      emit(TopupHistoryFailed(e.toString()));
    }
  }

  void fetchtopup() async {
    try {
      emit(TopupHistoryLoading());
      List<HistoryTopupMOdel> history = await HistoryService().fetchTopup();
      emit(TopupHistorySuccses(history));
    } catch (e) {
      emit(TopupHistoryFailed(e.toString()));
    }
  }
}
