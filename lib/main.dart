import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_bloc.dart';
import 'package:validation_form_using_bloc/sign_in/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SignInBloc(),
        child: SignInPage(),
      ),
    );
  }
}
