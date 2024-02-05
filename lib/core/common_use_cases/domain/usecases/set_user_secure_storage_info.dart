import 'package:covid/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../features/auth/domain/entities/login_entity.dart';
import '../../../network/failure.dart';
import '../../../repositories/local_storage_repository.dart';
import '../../../usecases/usecase.dart';

class GetUseCaseUserSecureStorageResult {
  GetUseCaseUserSecureStorageResult(this.result);
  final LoginEntity result;
}

class SetUserSecureStorageInfoUseCase extends UseCase<
    GetUseCaseUserSecureStorageResult, ParamsUseCaseSetSecurteStorage> {
  SetUserSecureStorageInfoUseCase(this.localStorageRepository);

  final LocalStorageRepository localStorageRepository;

  @override
  Future<Either<Failure, GetUseCaseUserSecureStorageResult>> call(
    ParamsUseCaseSetSecurteStorage params,
  ) async {
    try {
      LoginModel loginModel = LoginModel(
        documentType: params.loginEntity.documentType,
        documentNumber: params.loginEntity.documentNumber,
        password: params.loginEntity.password,
      );
      final result =
          await localStorageRepository.setSecureStorage(model: loginModel);
      return Right(GetUseCaseUserSecureStorageResult(result));
    } catch (e) {
      return Left(ErrorFailure());
    }
  }
}

class ParamsUseCaseSetSecurteStorage {
  final LoginEntity loginEntity;

  const ParamsUseCaseSetSecurteStorage({
    required this.loginEntity,
  });
}
