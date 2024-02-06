import 'package:covid/features/states/domain/repositories/states_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/states_entity.dart';

class GetListStatesUseCase implements UseCase<List<StatesEntity>, void> {
  final StatesRepository repository;

  GetListStatesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<StatesEntity>>> call(params) async {
    final result = await repository.getStates();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
