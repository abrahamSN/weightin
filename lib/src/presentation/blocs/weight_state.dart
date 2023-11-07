part of 'weight_cubit.dart';

@freezed
sealed class WeightState with _$WeightState {
  const factory WeightState.initial() = _Initial;
  const factory WeightState.loading() = _Loading;
  const factory WeightState.loaded({
    required List<WeightEntry?>? weights,
  }) = _Loaded;
  const factory WeightState.error({
    required Object error,
  }) = _Error;
  const factory WeightState.initialAction() = _InitialAction;
  const factory WeightState.successAction() = _SuccessAction;
}
