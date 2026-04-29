import 'package:go_router/go_router.dart';
import 'package:petter/core/di/di.dart';
import 'package:petter/core/router/auth_notifier.dart';
import 'package:petter/features/auth/domain/repositories/auth_repository.dart';
import 'package:petter/features/auth/presentation/page/sign_in_page.dart';
import 'package:petter/features/auth/presentation/page/sign_up_page.dart';
import 'package:petter/features/chat/presentation/pages/chat_page.dart';
import 'package:petter/features/chat/presentation/pages/conversation_page.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';
import 'package:petter/features/home/presentation/pages/notification_page.dart';
import 'package:petter/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/pages/my_pet_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_create_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_detail_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_update_page.dart';
import 'package:petter/features/pet/presentation/pages/search_page.dart';
import 'package:petter/features/splash/presentation/pages/splash_page.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/presentation/pages/account_page.dart';
import 'package:petter/features/user/presentation/pages/user_profile_page.dart';

final authNotifier = AuthNotifier(sl<AuthRepository>());

final List<String> publicRoutes = [
  AppRoutes.signIn.path,
  AppRoutes.signUp.path,
];

final routerConfig = GoRouter(
  initialLocation: AppRoutes.splash.path,
  refreshListenable: authNotifier,
  redirect: (context, state) {
    final isAuth = authNotifier.isAuthenticated;
    final isInitialized = authNotifier.isInitialized;
    final location = state.matchedLocation;

    if (!isInitialized) return AppRoutes.splash.path;

    final isPublic = publicRoutes.contains(location);

    if (!isAuth && !isPublic) {
      return AppRoutes.signIn.path;
    }

    if (isAuth && (isPublic || location == AppRoutes.splash.path)) {
      return AppRoutes.home.path;
    }

    return null;
  },
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      builder: (context, state) => const SplashPage(),
    ),
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
      name: AppRoutes.notification.name,
      path: AppRoutes.notification.path,
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      name: AppRoutes.conversation.name,
      path: AppRoutes.conversation.path,
      builder: (context, state) => const ConversationPage(),
      routes: [
        GoRoute(
          name: AppRoutes.chat.name,
          path: AppRoutes.chat.path,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ChatPage(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.search.name,
      path: AppRoutes.search.path,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      name: AppRoutes.petInfo.name,
      path: AppRoutes.petInfo.path,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final pet = state.extra! as Pet;
        return PetDetailPage(id: id, pet: pet);
      },
    ),
    GoRoute(
      name: AppRoutes.myPet.name,
      path: AppRoutes.myPet.path,
      builder: (context, state) {
        return const MyPetPage();
      },
      routes: [
        GoRoute(
          name: AppRoutes.myPetAdd.name,
          path: AppRoutes.myPetAdd.path,
          builder: (context, state) {
            return const PetCreatePage();
          },
        ),
        GoRoute(
          name: AppRoutes.myPetInfo.name,
          path: AppRoutes.myPetInfo.path,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final pet = state.extra! as Pet;
            return PetDetailPage(id: id, pet: pet);
          },
        ),
        GoRoute(
          name: AppRoutes.myPetUpdate.name,
          path: AppRoutes.myPetUpdate.path,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final pet = state.extra! as Pet;
            return PetUpdatePage(id: id, pet: pet);
          },
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.account.name,
      path: AppRoutes.account.path,
      builder: (context, state) => const AccountPage(),
      routes: [
        GoRoute(
          name: AppRoutes.userProfile.name,
          path: AppRoutes.userProfile.path,
          builder: (context, state) {
            final user = state.extra! as User;
            return UserProfilePage(user: user);
          },
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
  splash(name: 'splash', path: '/splash'),
  onboarding(name: 'onboarding', path: '/onboarding'),
  signUp(name: 'signUp', path: '/sign-up'),
  signIn(name: 'signIn', path: '/sign-in'),
  home(name: 'home', path: '/home'),
  notification(name: 'notification', path: '/notification'),
  conversation(name: 'conversation', path: '/conversation'),
  chat(name: 'chat', path: '/:id'),
  search(name: 'search', path: '/search'),
  petInfo(name: 'petInfo', path: '/pet/:id'),
  myPet(name: 'myPet', path: '/my-pet'),
  myPetAdd(name: 'myPetAdd', path: '/add'),
  myPetInfo(name: 'myPetInfo', path: '/:id'),
  myPetUpdate(name: 'myPetUpdate', path: '/:id/update'),
  account(name: 'account', path: '/account'),
  userProfile(name: 'userProfile', path: '/profile'),
  accountChangePassword(
    name: 'accountChangePassword',
    path: '/change-password',
  );

  const AppRoutes({required this.name, required this.path});

  final String name;
  final String path;
}
