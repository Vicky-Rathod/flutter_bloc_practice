part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String username;
  final String password;

  LoginRequested(this.username, this.password);
}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginFailureEvent extends LoginEvent {
  final String message;

  LoginFailureEvent(this.message);
}
