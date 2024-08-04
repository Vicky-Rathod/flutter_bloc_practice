import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum authTypeState {
  login,
  register,
  forgotPassword,
  resetPassword,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial(authTypeState.login)) {
    on<ChangeAuthEvent>((event, emit) {
      emit(ChangeAuthState(event.type));
    });
    on<GetAuthStateEvent>((event, emit) {
      emit(event.type);
    });
    on<AuthInfoEvent>((event, emit) {
      emit(AuthInfo(state.type, username: event.username, isLogin: event.isLogin, isLoading: event.isLoading));
    });
  }
}
