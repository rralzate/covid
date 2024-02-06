import 'package:covid/features/states/domain/entities/states_current_entity.dart';
import 'package:covid/features/states/domain/entities/states_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';

abstract class StatesRepository {
  Future<Either<Failure, List<StatesEntity>>> getStates();

  Future<Either<Failure, List<StatesCurrentEntity>>> getStatesCurrent();
}
