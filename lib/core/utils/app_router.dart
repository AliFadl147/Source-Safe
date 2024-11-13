import 'package:go_router/go_router.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/login_view.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/register_view.dart';

abstract class AppRouter {
  static const kRegisterView = '/registerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
