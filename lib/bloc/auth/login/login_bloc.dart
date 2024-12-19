import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/bloc/auth/login/login_event.dart';
import 'package:firebase_authentication/bloc/auth/login/login_state.dart';
import 'package:firebase_authentication/products/constants/string_constants.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginBloc(this._firebaseAuth) : super(LoginInitialState()) {
    on<SubmitLoginEvent>(_onSubmitLoginEvent);
  }

  Future<void> _onSubmitLoginEvent(
      SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        emit(LoginSuccessState(userCredential.user!.uid));
      } else {
        emit(LoginFailureState(StringConstants.userNotFount));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == StringConstants.userNotFount) {
        emit(LoginFailureState(StringConstants.noUserFoundForThatEmail));
      } else if (e.code == StringConstants.wrongPassword) {
        emit(LoginFailureState(StringConstants.wrongPasswordProvided));
      } else {
        emit(LoginFailureState("An error occurred: ${e.message}"));
      }
    }
  }
}
