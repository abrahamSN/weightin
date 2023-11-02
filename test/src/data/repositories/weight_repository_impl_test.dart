import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:weightin/src/data/datasources/datasources.dart';
import 'package:weightin/src/data/repositories/weight_repository_impl.dart';

class MockRemoteDataSource extends Mock implements WeightRemoteDatasource {}

void main() {
  WeightRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = WeightRepositoryImpl(
      remoteDatasource: mockRemoteDataSource,
    );
  });

  group('getWeights', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getWeights())
            .thenAnswer((_) async => Right(tWeightList));

        // act
        final result = await repository.getWeights();

        // assert
        verify(mockRemoteDataSource.getWeights());
        expect(result, Right(tWeightList));
      },
    );
  });
}
