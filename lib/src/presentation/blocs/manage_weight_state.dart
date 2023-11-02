part of 'manage_weight_cubit.dart';

@freezed
sealed class ManageWeightState with _$ManageWeightState {
  const factory ManageWeightState.initial({
    required double weight,
    required String date,
  }) = _Initial;
  const factory ManageWeightState.loading() = _Loading;
  const factory ManageWeightState.error({
    required Object error,
  }) = _Error;
  const factory ManageWeightState.success() = _Success;
}
