import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_bloc.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_event.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorText,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailEditingController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(_emailEditingController.text,
                      _passwordEditingController.text),
                );
              },
              decoration: const InputDecoration(hintText: 'Email Address'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordEditingController,
              decoration: const InputDecoration(hintText: 'Email Address'),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(_emailEditingController.text,
                      _passwordEditingController.text),
                );
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(_emailEditingController.text,
                              _passwordEditingController.text));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: const Text('Sign In'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
