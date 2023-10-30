import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'configs/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        title: 'Weightin',
        routerConfig: routerConfig,
        builder: Authenticator.builder(),
      ),
    );
  }
}
