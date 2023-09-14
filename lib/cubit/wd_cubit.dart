import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myairplane/models/wd_model.dart';
import 'package:myairplane/services/wd_services.dart';

part 'wd_state.dart';

class WdCubit extends Cubit<WdState> {
  WdCubit() : super(WdInitial());

  void createWdHistory({
    required String idWd,
    required String idUser,
    required String userEmail,
    required int wdAmount,
    required DateTime creationDateTime,
  }) async {
    try {
      emit(WdLoading());
      await WdServices().createWdHistory(WdModel(
          idWd: idWd,
          idUser: idUser,
          userEmail: userEmail,
          wdAmount: wdAmount,
          creationDateTime: creationDateTime));
      emit(const WdSuccses([]));
    } catch (e) {
      emit(WdFailed(e.toString()));
    }
  }

  void fetchWd() async {
    try {
      emit(WdLoading());
      List<WdModel> wdHistory = await WdServices().fetchWd();
      emit(WdSuccses(wdHistory));
    } catch (e) {
      emit(WdFailed(e.toString()));
    }
  }
}
