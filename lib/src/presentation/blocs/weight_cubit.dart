import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weightin/models/ModelProvider.dart';

import 'package:weightin/src/domain/repositories/weight_repository.dart';

part 'weight_state.dart';
part 'weight_cubit.freezed.dart';

class WeightCubit extends Cubit<WeightState> {
  final WeightRepository repository;

  WeightCubit({required this.repository}) : super(WeightState.initial());

  void fetchData() async {
    try {
      emit(WeightState.loading());
      final List<WeightEntry?>? res = await repository.getWeight();
      emit(WeightState.loaded(weights: res));
    } catch (e) {
      print(e);
      emit(WeightState.error(error: e));
    }
  }
}
