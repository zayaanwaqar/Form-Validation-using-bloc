abstract class SignInState {}

class SignInInitialState extends SignInState {}
class SignInValidState extends SignInState {}
class SignInLoadingState extends SignInState {}
class SignInErrorState extends SignInState {
  final String errorText;
  SignInErrorState(this.errorText);
}


