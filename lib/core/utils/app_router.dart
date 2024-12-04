import 'package:go_router/go_router.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/login_view.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/register_view.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/dashboard_view.dart';

abstract class AppRouter {
  static const kRegisterView = '/registerView';
  static const kDashboardView = '/dashboardView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const DashBoradView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => const DashBoradView(),
      ),
    ],
  );
}
