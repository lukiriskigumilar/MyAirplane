import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myairplane/cubit/transaction_cubit.dart';
import 'package:myairplane/models/topupHistory_model.dart';
import 'package:myairplane/models/user_model.dart';
import 'package:myairplane/services/auth_services.dart';
import 'package:myairplane/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthServices().signIn(email: email, password: password);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    required String hobby,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices()
          .signUp(email: email, password: password, name: name, hobby: hobby);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void updateBalance(var id, int newBalance) async {
    try {
      emit(AuthLoading());

      await UserService().updateUserBalance(id: id, newBalance: newBalance);

      UserModel updatedUser = await UserService().getUserById(id);

      emit(AuthSucces(updatedUser));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
