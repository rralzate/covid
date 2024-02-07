import 'package:covid/features/home/domain/entities/device_entity.dart';
import 'package:covid/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetCovidInformationUseCase implements UseCase<DeviceEntity, void> {
  final HomeRepository repository;

  GetCovidInformationUseCase({required this.repository});

  @override
  Future<Either<Failure, DeviceEntity>> call(params) async {
    final result = await repository.getCovidInformation();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
