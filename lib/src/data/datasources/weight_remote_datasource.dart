import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:weightin/models/ModelProvider.dart';
import 'package:weightin/models/WeightEntry.dart';

abstract class WeightRemoteDatasource {
  Future<List<WeightEntry?>?> getWeights();
  Future<void> saveWeight(WeightEntry weightEntry);
  Future<void> deleteWeight(WeightEntry weightEntry);
  Future<void> updateWeight(WeightEntry weightEntry);
}

class WeightRemoteDatasourceImpl implements WeightRemoteDatasource {
  @override
  Future<void> deleteWeight(WeightEntry weightEntry) async {
    final req = ModelMutations.delete<WeightEntry>(weightEntry);
    final res = await Amplify.API.mutate(request: req).response;

    safePrint('Delete response: $res');
  }

  @override
  Future<List<WeightEntry?>?> getWeights() async {
    List<WeightEntry?>? items = List.empty();

    try {
      final req = ModelQueries.list(WeightEntry.classType);
      final res = await Amplify.API.query(request: req).response;

      items = res.data?.items;

      if (res.hasErrors) {
        safePrint('errors: $res');
      }
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return items;
  }

  @override
  Future<void> updateWeight(WeightEntry weightEntry) async {
    try {
      final req = ModelMutations.update<WeightEntry>(weightEntry);
      final res = await Amplify.API.mutate(request: req).response;

      safePrint('Update result: $res');
    } catch (e) {
      safePrint('Update failed: $e');
    }
  }

  @override
  Future<void> saveWeight(WeightEntry weightEntry) async {
    try {
      final req = ModelMutations.create(weightEntry);
      final res = await Amplify.API.mutate(request: req).response;

      safePrint('Create result: $res');
    } catch (e) {
      safePrint('Create failed: $e');
    }
  }
}
