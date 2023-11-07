import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (List<WeightEntry?>? items) {
            if (items!.isEmpty) {
              return const Center(
                child: Text('No history yet'),
              );
            }
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                final WeightEntry? item = items[index];
                return ListTile(
                  title: Text(items[index]!.weight.toString()),
                  subtitle: Text(items[index]!.date),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      weightCubit.weightController.text =
                          item!.weight.toString();
                      weightCubit.dateController.text = item.date.toString();
                      weightCubit.isEdit = true;
                      weightCubit.isSuccess = false;

                      weightCubit.weightEntryData = item;
                      context.push('/add-edit-weight');
                    },
                  ),
                );
              },
            );
          },
          error: (err) => Center(
            child: Text(err.toString()),
          ),
          successAction: () {
            weightCubit.fetchData();
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          initialAction: () {
            return Container();
          },
        );
      },
    );
  }
}
