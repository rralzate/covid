import 'package:covid/features/states/domain/repositories/states_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/region_detail_entity.dart';

class GetRegionDetailUseCase
    implements UseCase<RegionDetailEntity, ParamsUseCaseRegionDetail> {
  final StatesRepository repository;

  GetRegionDetailUseCase({required this.repository});

  @override
  Future<Either<Failure, RegionDetailEntity>> call(params) async {
    final result = await repository.getRegionDetailByState(params.regionState);

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}

class ParamsUseCaseRegionDetail {
  final String regionState;

  const ParamsUseCaseRegionDetail({
    required this.regionState,
  });
}
