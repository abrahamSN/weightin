import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuilder(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Signin'),
    );
  }

  Widget _bodyBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Signin'),
        ),
      ],
    );
  }
}
