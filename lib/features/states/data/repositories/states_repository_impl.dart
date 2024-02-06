import 'package:covid/core/network/failure.dart';

import 'package:covid/features/states/domain/entities/states_current_entity.dart';

import 'package:covid/features/states/domain/entities/states_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../domain/repositories/states_repository.dart';
import '../datasources/states_datasource.dart';

class StatesRepositoryImpl implements StatesRepository {
  final StatesDatasource statesDatasource;

  StatesRepositoryImpl({
    required this.statesDatasource,
  });

  @override
  Future<Either<Failure, List<StatesEntity>>> getStates() async {
    try {
      final result = await statesDatasource.getStates();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StatesCurrentEntity>>> getStatesCurrent() async {
    try {
      final result = await statesDatasource.getStatesCurrent();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e.toString()));
    }
  }
}
