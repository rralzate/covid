import 'package:dartz/dartz.dart';
import '../../../../core/network/failure.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(LoginEntity loginEntity);

  Future<Either<Failure, LoginEntity>> register(LoginEntity loginEntity);
}
