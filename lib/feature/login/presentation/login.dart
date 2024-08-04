import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/feature/auth/presentaion/bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc_practice/feature/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc_practice/feature/login/presentation/widgets/auth_button.dart';
import 'package:flutter_bloc_practice/feature/login/presentation/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocConsumer(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          BlocProvider.of<AuthBloc>(context).add(AuthInfoEvent(_usernameController.text, true, false));
          final authBloc = BlocProvider.of<AuthBloc>(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login Success'),
          ));
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputField(
              label: 'Username',
              controller: _usernameController,
              keyboardType: TextInputType.text,
              obscureText: false,
              autocorrect: false,
              autofocus: false,
              readOnly: false,
              enableSuggestions: true,
            ),
            InputField(
              label: 'Password',
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              autocorrect: false,
              autofocus: false,
              readOnly: false,
              enableSuggestions: false,
            ),
            const SizedBox(
              height: 50,
            ),
            AuthButton(
              label: 'Login',
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginRequested(_usernameController.text, _passwordController.text));
              },
              color: Colors.blue,
              textColor: Colors.white,
              isLoading: state == LoginLoading ?? false,
              isDisabled: state == LoginLoading ?? false,
            ),
          ],
        );
      },
    );
  }
}
