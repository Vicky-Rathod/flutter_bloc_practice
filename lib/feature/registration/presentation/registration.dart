import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/feature/auth/presentaion/bloc/bloc/auth_bloc.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Registration Screen'),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(ChangeAuthEvent(authTypeState.login));
          },
          child: const Text('Go to Login'),
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
    );
  }
}
