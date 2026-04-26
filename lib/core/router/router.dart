import 'package:go_router/go_router.dart';
import 'package:petter/features/account/presentation/pages/account_page.dart';
import 'package:petter/features/auth/presentation/page/sign_in_page.dart';
import 'package:petter/features/auth/presentation/page/sign_up_page.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';
import 'package:petter/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_create_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_detail_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.signIn.path,
  routes: [
    GoRoute(
      name: AppRoutes.onboarding.name,
      path: AppRoutes.onboarding.path,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: AppRoutes.signUp.name,
      path: AppRoutes.signUp.path,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: AppRoutes.signIn.name,
      path: AppRoutes.signIn.path,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: AppRoutes.home.name,
      path: AppRoutes.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AppRoutes.petAdd.name,
      path: AppRoutes.petAdd.path,
      builder: (context, state) {
        return const PetCreatePage();
      },
    ),
    GoRoute(
      name: AppRoutes.petInfo.name,
      path: AppRoutes.petInfo.path,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return PetDetailPage(id: id);
      },
    ),
    GoRoute(
      name: AppRoutes.account.name,
      path: AppRoutes.account.path,
      builder: (context, state) => const AccountPage(),
      routes: [
        GoRoute(
          name: AppRoutes.accountInfo.name,
          path: AppRoutes.accountInfo.path,
          builder: (context, state) => const AccountPage(),
        ),
        GoRoute(
          name: AppRoutes.accountChangePassword.name,
          path: AppRoutes.accountChangePassword.path,
          builder: (context, state) => const AccountPage(),
        ),
      ],
    ),
  ],
);

enum AppRoutes {
  onboarding(name: 'onboarding', path: '/onboarding'),
  signUp(name: 'signUp', path: '/sign-up'),
  signIn(name: 'signIn', path: '/sign-in'),
  home(name: 'home', path: '/home'),
  search(name: 'search', path: '/search'),
  petInfo(name: 'petInfo', path: '/pet/:id'),
  petAdd(name: 'petAdd', path: '/pet/add'),
  account(name: 'account', path: '/account'),
  accountInfo(name: 'accountInfo', path: '/info'),
  accountChangePassword(
    name: 'accountChangePassword',
    path: '/change-password',
  );

  const AppRoutes({required this.name, required this.path});

  final String name;
  final String path;
}
