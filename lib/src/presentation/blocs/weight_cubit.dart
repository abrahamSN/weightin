import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weightin/models/ModelProvider.dart';

import 'package:weightin/src/domain/repositories/weight_repository.dart';

part 'weight_state.dart';
part 'weight_cubit.freezed.dart';

class WeightCubit extends Cubit<WeightState> {
  final WeightRepository repository;

  WeightCubit({required this.repository}) : super(const WeightState.initial());

  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  WeightEntry weightEntryData = WeightEntry(weight: 00.0, date: '');

  bool isEdit = false;
  bool isSuccess = false;

  void fetchData() async {
    try {
      emit(const WeightState.loading());
      final List<WeightEntry?>? res = await repository.getWeight();
      emit(WeightState.loaded(weights: res));
    } catch (e) {
      emit(WeightState.error(error: e));
    }
  }

  void addData() async {
    try {
      emit(const WeightState.loading());

      final newEntry = WeightEntry(
        weight: double.parse(weightController.text),
        date: dateController.text,
      );

      await repository.saveWeight(newEntry);

      emit(const WeightState.successAction());
    } catch (e) {
      emit(WeightState.error(error: e));
    }
  }

  void editData() async {
    try {
      emit(const WeightState.loading());

      final updateEntry = weightEntryData.copyWith(
        date: dateController.text,
        weight: double.parse(weightController.text),
      );

      await repository.updateWeight(updateEntry);

      emit(const WeightState.successAction());
    } catch (e) {
      emit(WeightState.error(error: e));
    }
  }

  void deleteData() async {
    try {
      emit(const WeightState.loading());
      await repository.deleteWeight(weightEntryData);
      emit(const WeightState.successAction());
    } catch (e) {
      emit(WeightState.error(error: e));
    }
  }
}
