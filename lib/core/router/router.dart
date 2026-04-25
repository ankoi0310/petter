import 'package:go_router/go_router.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_detail_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.pet,
      builder: (context, state) {
        final id = state.pathParameters['id']! as int;
        return PetDetailPage(id: id);
      },
    ),
  ],
);

class AppRoutes {
  static const String home = '/home';
  static const String pet = '/pet/:id';
}
