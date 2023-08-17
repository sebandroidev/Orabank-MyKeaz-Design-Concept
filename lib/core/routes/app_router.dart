import 'package:go_router/go_router.dart';

import '../../screens/authentication/authentication_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: <GoRoute>[
    GoRoute(
      builder: (context, state) => const HomeScreen(),
      path: '/',
    ),
    GoRoute(
      builder: (context, state) => const OnboardingScreen(),
      path: '/onboarding',
    ),
    GoRoute(
      builder: (context, state) => const AuthenticationScreen(),
      path: '/authentication',
    ),
  ],
);
