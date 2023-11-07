import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:weightin/models/WeightEntry.dart';

import 'package:weightin/src/data/datasources/weight_remote_datasource.dart';

import 'package:weightin/src/domain/repositories/weight_repository.dart';

class WeightRepositoryImpl implements WeightRepository {
  final WeightRemoteDatasource remoteDatasource;

  WeightRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<void> deleteWeight(WeightEntry weightEntry) async {
    try {
      await remoteDatasource.deleteWeight(weightEntry);
    } catch (err) {
      safePrint("Could not delete weight: $err");
    }
  }

  @override
  Future<List<WeightEntry?>?> getWeight() async {
    List<WeightEntry?>? items = List.empty();

    try {
      final res = await remoteDatasource.getWeights();
      items = res;
    } catch (err) {
      safePrint("Could not query DataStore: $err");
    }

    return items;
  }

  @override
  Future<void> saveWeight(WeightEntry weightEntry) async {
    try {
      return await remoteDatasource.saveWeight(weightEntry);
    } catch (e) {
      safePrint('Error saving weight: $e');
    }
  }

  @override
  Future<void> updateWeight(WeightEntry weightEntry) async {
    try {
      return await remoteDatasource.updateWeight(weightEntry);
    } catch (err) {
      safePrint("Could not update weight: $err");
    }
  }
}
