import 'package:covid/features/auth/domain/entities/login_entity.dart';
import 'package:covid/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';

class PostLoginUseCase implements UseCase<bool, ParamsUseCasePostLogin> {
  final AuthRepository repository;

  PostLoginUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ParamsUseCasePostLogin params) async {
    final result = await repository.login(params.loginEntity);

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}

class ParamsUseCasePostLogin {
  final LoginEntity loginEntity;

  const ParamsUseCasePostLogin({
    required this.loginEntity,
  });
}
