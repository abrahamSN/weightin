import 'package:go_router/go_router.dart';

import '../presentation/screens/main_screen.dart';

final GoRouter routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    )
  ],
);
