import 'package:go_router/go_router.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';
import 'package:petter/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_detail_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.onboarding.path,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding.path,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AppRoutes.pet.name,
      path: AppRoutes.pet.path,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return PetDetailPage(id: id);
      },
    ),
  ],
);

enum AppRoutes {
  onboarding(name: 'onboarding', path: '/onboarding'),
  home(name: 'home', path: '/home'),
  pet(name: 'pet', path: '/pet/:id');

  const AppRoutes({required this.name, required this.path});

  final String name;
  final String path;
}
