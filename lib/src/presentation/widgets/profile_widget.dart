import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _circularAvatar(),
          _editIcon(),
        ],
      ),
    );
  }

  CircleAvatar _circularAvatar() {
    return const CircleAvatar(
      radius: 50,
      child: Text('AB'),
    );
  }

  Widget _editIcon() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: ClipOval(
        child: Container(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
