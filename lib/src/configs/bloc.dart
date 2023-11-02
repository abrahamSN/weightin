import 'package:nested/nested.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weightin/src/data/datasources/datasources.dart';
import 'package:weightin/src/data/repositories/repositories.dart';

import 'package:weightin/src/presentation/blocs/blocs.dart';
import 'package:weightin/src/presentation/blocs/manage_weight_cubit.dart';

List<SingleChildWidget> get blocProvider {
  return [
    BlocProvider(
      create: (_) => NavbarCubit(),
    ),
    BlocProvider(
      create: (_) => ManageWeightCubit(
        repository: WeightRepositoryImpl(
          remoteDatasource: WeightRemoteDatasourceImpl(),
        ),
      ),
    ),
    BlocProvider(
      create: (_) => WeightCubit(
        repository: WeightRepositoryImpl(
          remoteDatasource: WeightRemoteDatasourceImpl(),
        ),
      )..fetchData(),
    ),
  ];
}
