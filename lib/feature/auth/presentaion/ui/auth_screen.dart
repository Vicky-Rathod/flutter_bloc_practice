import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/feature/auth/presentaion/bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc_practice/feature/login/presentation/login.dart';
import 'package:flutter_bloc_practice/feature/registration/presentation/registration.dart';
import 'package:flutter_bloc_practice/feature/reset_password/presentation/reset_password.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Widget _currentScreen = const LoginScreen();
  @override
  Widget build(BuildContext context) {
    final authUpdateStateBloc = BlocProvider.of<AuthBloc>(context);

    return BlocConsumer(
        listener: (context, state) {
          if (state is ChangeAuthState) {
            if (state.type == authTypeState.login) {
              _currentScreen = const LoginScreen();
            } else if (state.type == authTypeState.register) {
              _currentScreen = const Registration();
            } else if (state.type == authTypeState.resetPassword) {
              _currentScreen = const ResetPasswordScreen();
            }
          }
        },
        bloc: authUpdateStateBloc,
        builder: (context, state) => Scaffold(
              backgroundColor: const Color.fromRGBO(24, 24, 32, 1),
              body: Column(
                children: [
                  Align(alignment: Alignment.topCenter, child: Image.asset('assets/images/signin_balls.png')),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please login to continue',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  _currentScreen,
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.register));
                              },
                              child: const Text('Go to Registration'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.forgotPassword));
                              },
                              child: const Text('Go to Forget Password'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.resetPassword));
                              },
                              child: const Text('Go to Reset Password'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
