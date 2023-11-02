import 'package:flutter/material.dart';

import 'package:weightin/src/presentation/widgets/widgets.dart';

class ManageWeightScreen extends StatelessWidget {
  const ManageWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Data'),
      ),
      body: _bodyBuilder(),
    );
  }

  SingleChildScrollView _bodyBuilder() {
    return SingleChildScrollView(
      child: FormWeight(),
    );
  }
}
