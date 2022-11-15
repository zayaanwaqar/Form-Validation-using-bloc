import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_event.dart';
import 'package:validation_form_using_bloc/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
    if(EmailValidator.validate(event.emailValue) == false){
      emit(SignInErrorState('Enter a valid email address'),);
    }
    else if(event.passwordValue.length < 8){
      emit( SignInErrorState('Password should be more then 8 characters'),);
    }
    else{
      emit(SignInValidState());
    }
    });
    on<SignInSubmittedEvent>((event, emit) {
     emit(SignInLoadingState());
    });
  }
}
