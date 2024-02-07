import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/device_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, DeviceEntity>> getCovidInformation();
}
