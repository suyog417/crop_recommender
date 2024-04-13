import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignInState {}

class AuthInitialState extends SignInState{}
class AuthLoadingState extends SignInState {}
class AuthCodeSentState extends SignInState {}
class AuthCodeVerifiedState extends SignInState {}
class AuthLoggedInState extends SignInState {
  final User firebaseUser;
  AuthLoggedInState(this.firebaseUser);
}
class AuthLoggedOutState extends SignInState {}
class AuthErrorState extends SignInState {
  final String error;
  AuthErrorState(this.error);
}

class SignInCubit extends Cubit<SignInState>{

  final FirebaseAuth auth = FirebaseAuth.instance;
  SignInCubit() : super(AuthInitialState()) {
    User? currentUser = auth.currentUser;
    if (currentUser != null){
      emit(AuthLoggedInState(currentUser));
    }
    else{
      emit(AuthLoggedOutState());
    }
  }
  String ? _verificationID;
  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        codeSent: (verificationId, forceResendingToken) {
        _verificationID = verificationId;
        emit(AuthCodeSentState());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationID = verificationId;
        },
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationID!,
        smsCode: otp
    );
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try{
      UserCredential userCredential = await auth.signInWithCredential(credential);
      if(userCredential.user != null){
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch(error){
      emit(AuthErrorState(error.message.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
    emit(AuthLoggedOutState());
  }
}
