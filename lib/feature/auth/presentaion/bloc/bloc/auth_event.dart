part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class ChangeAuthEvent extends AuthEvent {
  final authTypeState type;

  ChangeAuthEvent(this.type);
}

final class GetAuthStateEvent extends AuthEvent {
  final AuthState type;

  GetAuthStateEvent(this.type);
}

final class AuthInfoEvent extends AuthEvent {
  final String username;
  final bool isLogin;
  final bool isLoading;

  AuthInfoEvent(this.username, this.isLogin, this.isLoading);
}
