import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weightin/models/ModelProvider.dart';

import 'package:weightin/src/presentation/blocs/blocs.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeightCubit weightCubit = context.read<WeightCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
      ),
      body: _bodyBuilder(weightCubit),
    );
  }

  BlocBuilder _bodyBuilder(WeightCubit weightCubit) {
    return BlocBuilder<WeightCubit, WeightState>(
      bloc: weightCubit,
      builder: (context, state) {
        return state.when(
          initial: () {
            weightCubit.fetchData();
            return Center(child: Text('kosong'));
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (List<WeightEntry?>? items) {
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]!.date),
                  subtitle: Text(items[index]!.weight.toString()),
                );
              },
            );
          },
          error: (err) => Center(
            child: Text(err.toString()),
          ),
        );
      },
    );
  }
}
