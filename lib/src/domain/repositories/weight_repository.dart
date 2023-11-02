import 'package:weightin/models/ModelProvider.dart';

abstract class WeightRepository {
  Future<List<WeightEntry?>?> getWeight();
  Future saveWeight(WeightEntry weightEntry);
  Future deleteWeight(WeightEntry weightEntry);
  Future updateWeight(WeightEntry weightEntry);
}
