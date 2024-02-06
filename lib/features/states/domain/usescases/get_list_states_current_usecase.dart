import 'package:covid/features/states/domain/repositories/states_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:covid/features/states/domain/entities/states_current_entity.dart';

class GetListStatesCurrentUseCase
    implements UseCase<List<StatesCurrentEntity>, void> {
  final StatesRepository repository;

  GetListStatesCurrentUseCase({required this.repository});

  @override
  Future<Either<Failure, List<StatesCurrentEntity>>> call(params) async {
    final result = await repository.getStatesCurrent();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
