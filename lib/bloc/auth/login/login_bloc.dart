import 'package:bloc/bloc.dart';
import 'package:firebase_authentication/bloc/auth/login/login_event.dart';
import 'package:firebase_authentication/bloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitLoginEvent) {
      yield LoginLoadingState();

      if (event.email.isEmpty || event.password.isEmpty) {
        yield LoginFailureState("Email and Password cannot be empty.");
        return;
      }

      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(event.email)) {
        yield LoginFailureState("Invalid email format.");
        return;
      }

      yield LoginSuccessState();
    }
  }
}
