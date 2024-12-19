import 'package:firebase_authentication/view/auth/login/login_view_imports.dart';


class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                context.read<LoginBloc>().add(
                      SubmitLoginEvent(email, password),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                StringConstants.logIn,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
    );
  }
}
