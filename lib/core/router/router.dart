import 'package:go_router/go_router.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

class AppRoutes {
  static const String home = '/home';
}
