import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/feature/auth/presentaion/bloc/bloc/auth_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Reset Password Screen'),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.login));
            },
            child: const Text('Go to Login')),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.register));
            },
            child: const Text('Go to Registration')),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.forgotPassword));
            },
            child: const Text('Go to Forget Password')),
      ],
    );
  }
}
