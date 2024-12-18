import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_authentication/bloc/auth/register/register_bloc.dart';
import 'package:firebase_authentication/bloc/auth/register/register_event.dart';
import 'package:firebase_authentication/bloc/auth/register/register_state.dart';
import 'package:firebase_authentication/products/constants/string_constants.dart';
import 'package:go_router/go_router.dart';
import 'widgets/email_field.dart';
import 'widgets/password_field.dart';
import 'widgets/register_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RegisterBloc(FirebaseAuth.instance), // RegisterBloc burada sağlanıyor
      child: RegisterViewBody(),
    );
  }
}

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  _RegisterViewBodyState createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.1),
                Text(
                  StringConstants.createYourAccount,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Text(
                  StringConstants.welcome,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: screenSize.height * 0.03),
                EmailField(
                  controller: emailController,
                  nextFocusNode: passwordFocusNode,
                ),
                const SizedBox(height: 20),
                PasswordField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  nextFocusNode: confirmPasswordFocusNode,
                  labelText: StringConstants.password,
                ),
                const SizedBox(height: 20),
                PasswordField(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  nextFocusNode: FocusNode(),
                  labelText: StringConstants.confirmPassword,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Kayıt başarılı!'),
                        backgroundColor: Colors.green,
                      ));
                    } else if (state is RegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return CircularProgressIndicator();
                    }
                    return RegisterButton(
                      onPressed: () {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterWithEmailEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Şifreler eşleşmiyor!"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.alreadyHaveAnAccount,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text(
                        StringConstants.logIn,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
