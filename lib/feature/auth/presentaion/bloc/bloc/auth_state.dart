part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final authTypeState type;
  final String? username;
  final bool? isLogin;
  final bool? isLoading;
  const AuthState(this.type, {this.username, this.isLogin, this.isLoading});
}

final class AuthInitial extends AuthState {
  @override
  final authTypeState type;

  const AuthInitial(this.type) : super(authTypeState.login);
}

final class ChangeAuthState extends AuthState {
  const ChangeAuthState(super.type);
}

final class AuthInfo extends AuthState {
  const AuthInfo(super.type, {super.username, super.isLogin, super.isLoading});
}
