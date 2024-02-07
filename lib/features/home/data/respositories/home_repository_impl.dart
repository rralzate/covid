import 'package:covid/features/home/data/datasources/home_datasource.dart';
import 'package:covid/features/home/domain/entities/device_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/failure.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl({required this.homeDatasource});
  @override
  Future<Either<Failure, DeviceEntity>> getCovidInformation() async {
    try {
      DeviceEntity deviceEntity = DeviceEntity.empty();

      final result = await homeDatasource.getCovidInformation();

      if (result.isNotEmpty) {
        deviceEntity = result.first;
      }
      return Right(deviceEntity);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e.toString()));
    }
  }
}
