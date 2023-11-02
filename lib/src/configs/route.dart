import 'package:go_router/go_router.dart';

import '../presentation/screens/screens.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'main',
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      name: 'manage-weight',
      path: '/manage-weight',
      builder: (context, state) => const ManageWeightScreen(),
    ),
  ],
);
