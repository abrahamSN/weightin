import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weightin/models/ModelProvider.dart';

import 'package:weightin/src/data/repositories/weight_repository_impl.dart';

part 'manage_weight_state.dart';
part 'manage_weight_cubit.freezed.dart';

class ManageWeightCubit extends Cubit<ManageWeightState> {
  final WeightRepositoryImpl repository;

  ManageWeightCubit({required this.repository})
      : super(
          const ManageWeightState.initial(
            weight: 00.00,
            date: "2015-02-01",
          ),
        );

  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void storeData() async {
    try {
      emit(const ManageWeightState.loading());

      final newEntry = WeightEntry(
        weight: double.parse(weightController.text),
        date: dateController.text,
      );

      await repository.saveWeight(newEntry);

      emit(ManageWeightState.success());
    } catch (e) {
      emit(ManageWeightState.error(error: e));
    }
  }
}
