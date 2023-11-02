import 'package:flutter/material.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
    );
  }

  SingleChildScrollView _bodyBuilder() {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, Good Morning",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We wish you have a nice day",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: Text('chart'),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: Column(
              children: [
                Text('count goals'),
                Text('target goals'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('feeds for body goals'),
        ],
      ),
    );
  }
}
