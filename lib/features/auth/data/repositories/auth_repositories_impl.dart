import 'package:covid/core/network/exception.dart';
import 'package:covid/core/network/failure.dart';
import 'package:covid/features/auth/data/datasources/auth_datasource.dart';
import 'package:covid/features/auth/data/models/login_model.dart';
import 'package:covid/features/auth/domain/entities/login_entity.dart';
import 'package:covid/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/repositories/local_storage_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource authDataSource;
  final LocalStorageRepository localStorageRepository;

  AuthRepositoryImp({
    required this.authDataSource,
    required this.localStorageRepository,
  });

  @override
  Future<Either<Failure, bool>> login(LoginEntity loginEntity) async {
    try {
      bool response = false;
      final result = await localStorageRepository.getSecureStorage();

      if (result.documentNumber > 0 &&
          result.documentNumber == loginEntity.documentNumber &&
          result.password.isNotEmpty &&
          result.password == loginEntity.password) {
        response = true;
      }

      return right(response);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> register(LoginEntity loginEntity) async {
    try {
      LoginModel loginModel = LoginModel(
        documentType: loginEntity.documentType,
        documentNumber: loginEntity.documentNumber,
        password: loginEntity.password,
      );
      final result =
          await localStorageRepository.setSecureStorage(model: loginModel);

      return right(result);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
}
