import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuilder(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Hi Hallo'),
    );
  }

  Widget _bodyBuilder() {
    return const Center(
      child: Text('Main Screen'),
    );
  }
}
