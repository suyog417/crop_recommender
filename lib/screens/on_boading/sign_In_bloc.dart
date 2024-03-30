import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignInState {}

class InitialState extends SignInState {}
class ErrorState extends SignInState {}
class SuccessState extends SignInState {}
class LoadingState extends SignInState {}

class SignInCubit extends Cubit<SignInState>{
  SignInCubit() : super(InitialState());

  void checkOTP(){
    emit(SuccessState());
  }

  void checkName(String name){
      emit(SuccessState());
  }
}
