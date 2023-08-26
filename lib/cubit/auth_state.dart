part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

//Jika Berhasil Autetikasi
class AuthSucces extends AuthState {
  final UserModel user;

  const AuthSucces(this.user);

  @override
  List<Object> get props => [user];
}

//jika gagal Auth

class AuthFailed extends AuthState {
  final String error;

  const AuthFailed(this.error);
  @override
  List<Object> get props => [error];
}
