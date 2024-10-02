import 'package:go_router/go_router.dart';
import 'package:project_memorable/src/view/landing/landing_view.dart';
import 'package:project_memorable/src/view/setting/notification_view.dart';
import 'package:project_memorable/src/view/signup/sign_up_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/landing',
    routes: [
      GoRoute(
        path: '/landing',
        builder: (context, state) => const LandingView(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/noti',
        builder: (context, state) => const NotificationView(),
      ),
    ],
  );
}
