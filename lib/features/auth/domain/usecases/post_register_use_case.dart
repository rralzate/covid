import 'package:covid/features/auth/domain/entities/login_entity.dart';
import 'package:covid/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';

class PostRegisterUseCase
    implements UseCase<LoginEntity, ParamsUseCasePostRegister> {
  final AuthRepository repository;

  PostRegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, LoginEntity>> call(
      ParamsUseCasePostRegister params) async {
    final result = await repository.register(params.loginEntity);

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}

class ParamsUseCasePostRegister {
  final LoginEntity loginEntity;

  const ParamsUseCasePostRegister({
    required this.loginEntity,
  });
}
