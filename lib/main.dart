import 'package:flutter/material.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'amplifyconfiguration.dart';

import './models/ModelProvider.dart';
import './src/app.dart';

void main() async {
  await _configureAmplify();
  runApp(const App());
}

Future<void> _configureAmplify() async {
  try {
    // create api plugin
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);

    // create auth plugin
    final auth = AmplifyAuthCognito();

    await Amplify.addPlugins([api, auth]);
    await Amplify.configure(amplifyconfig);

    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}
