import 'package:flutter/material.dart';

bottomSheetWeight(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const Column(
        children: [
          Text('pilih weights'),
          Text('pilih tanggal'),
          Text('save button'),
        ],
      );
    },
  );
}
