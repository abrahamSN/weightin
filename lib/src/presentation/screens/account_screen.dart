import 'package:flutter/material.dart';
import 'package:weightin/src/presentation/widgets/profile_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _bodyBuilder(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'abrahamsn',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _bodyBuilder() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        Card(
          child: Column(
            children: [],
          ),
        ),
        ProfileWidget(),
        SizedBox(height: 24),
        Text('abrahamsn.mayer@gmail.com'),
        SizedBox(height: 24),
        Text('abrahamsn.mayer@gmail.com'),
        SizedBox(height: 20),
      ],
    );
  }
}
