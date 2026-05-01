import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/di/di.dart';
import 'package:petter/core/router/bloc_listenable.dart';
import 'package:petter/features/adoption/presentation/pages/adoption_request_page.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/auth/presentation/page/sign_in_page.dart';
import 'package:petter/features/auth/presentation/page/sign_up_page.dart';
import 'package:petter/features/chat/domain/entities/chat_room.dart';
import 'package:petter/features/chat/presentation/bloc/chat_message/chat_message_bloc.dart';
import 'package:petter/features/chat/presentation/pages/chat_detail_page.dart';
import 'package:petter/features/chat/presentation/pages/chat_page.dart';
import 'package:petter/features/favorite/presentation/pages/favorite_page.dart';
import 'package:petter/features/home/presentation/pages/home_page.dart';
import 'package:petter/features/home/presentation/pages/notification_page.dart';
import 'package:petter/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/pages/my_pet_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_create_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_detail_page.dart';
import 'package:petter/features/pet/presentation/pages/pet_update_page.dart';
import 'package:petter/features/search/presentation/pages/search_page.dart';
import 'package:petter/features/splash/presentation/pages/splash_page.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/presentation/pages/account_page.dart';
import 'package:petter/features/user/presentation/pages/user_profile_page.dart';

final List<String> publicRoutes = [
  AppRoutes.signIn.path,
  AppRoutes.signUp.path,
];

final routerConfig = GoRouter(
  initialLocation: AppRoutes.splash.path,
  refreshListenable: BlocListenable(sl<AuthBloc>()),
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;
    final location = state.matchedLocation;

    final isPublic = publicRoutes.contains(location);

    return authState.maybeWhen(
      authenticated: (user) {
        if (location == AppRoutes.splash.path || isPublic) {
          return AppRoutes.home.path;
        }

        return null;
      },
      unauthenticated: () {
        return !isPublic ? AppRoutes.signIn.path : null;
      },
      orElse: () => null,
    );
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
      name: AppRoutes.chat.name,
      path: AppRoutes.chat.path,
      builder: (context, state) => const ChatPage(),
      routes: [
        GoRoute(
          name: AppRoutes.chatDetail.name,
          path: AppRoutes.chatDetail.path,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final room = state.extra! as ChatRoom;
            return BlocProvider(
              create: (context) => sl.call<ChatMessageBloc>(
                param1: id,
              )..add(const ChatMessageEvent.subscriptionRequested()),
              child: ChatDetailPage(id: id, room: room),
            );
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
      name: AppRoutes.favorite.name,
      path: AppRoutes.favorite.path,
      builder: (context, state) {
        return const FavoritePage();
      },
    ),
    GoRoute(
      name: AppRoutes.adoptionRequest.name,
      path: AppRoutes.adoptionRequest.path,
      builder: (context, state) {
        return const AdoptionRequestPage();
      },
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
  chat(name: 'conversation', path: '/conversation'),
  chatDetail(name: 'chatDetail', path: '/:id'),
  search(name: 'search', path: '/search'),
  petInfo(name: 'petInfo', path: '/pet/:id'),
  myPet(name: 'myPet', path: '/my-pet'),
  myPetAdd(name: 'myPetAdd', path: '/add'),
  myPetInfo(name: 'myPetInfo', path: '/:id'),
  myPetUpdate(name: 'myPetUpdate', path: '/:id/update'),
  favorite(name: 'favorite', path: '/favorite'),
  adoptionRequest(name: 'adoptionRequest', path: '/adoption-request'),
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
