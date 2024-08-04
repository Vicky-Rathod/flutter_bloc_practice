import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>((event, emit) {
      emit(LoginLoading());
      print(event.username);
      if (event.username.isEmpty || event.password.isEmpty) {
        emit(LoginFailure('Username and password cannot be empty'));
      } else if (event.username == 'admin' && event.password == 'admin') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Invalid username or password'));
      }
    });
  }
}
