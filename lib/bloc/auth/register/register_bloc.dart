import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuth _firebaseAuth;

  RegisterBloc(this._firebaseAuth) : super(RegisterInitial()) {
    on<RegisterWithEmailEvent>((event, emit) async {
      emit(RegisterLoading());

      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(RegisterSuccess());
      } on FirebaseAuthException catch (e) {
        emit(RegisterFailure(
            errorMessage: e.message ?? StringConstants.anErrorOccured));
      }
    });
  }
}
