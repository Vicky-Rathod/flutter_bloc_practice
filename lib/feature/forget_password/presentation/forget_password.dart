import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/feature/auth/presentaion/bloc/bloc/auth_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Forget Password Screen'),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.login));
          },
          child: const Text('Go to Login'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.register));
          },
          child: const Text('Go to Registration'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.resetPassword));
          },
          child: const Text('Go to Reset Password'),
        ),
      ],
    );
  }
}
