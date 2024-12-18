import 'package:firebase_authentication/view/auth/login/login_view.dart';
import 'package:firebase_authentication/view/auth/register/register_view.dart';
import 'package:firebase_authentication/view/home/home_view.dart';
import 'package:firebase_authentication/view/success/success_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: '/success',
        builder: (context, state) => const SuccessView(),
      )
    ],
  );
}
