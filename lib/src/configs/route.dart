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
      name: 'add-edit-weight',
      path: '/add-edit-weight',
      builder: (context, state) => const AddEditWeightScreen(),
    ),
  ],
);
