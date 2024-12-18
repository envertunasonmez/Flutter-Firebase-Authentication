abstract class RegisterEvent {}

class RegisterWithEmailEvent extends RegisterEvent {
  final String email;
  final String password;

  RegisterWithEmailEvent({required this.email, required this.password});
}
