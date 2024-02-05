import 'package:dartz/dartz.dart';

import '../../../../features/auth/domain/entities/login_entity.dart';
import '../../../network/failure.dart';
import '../../../repositories/local_storage_repository.dart';
import '../../../usecases/usecase.dart';

class GetUseCaseUserSecureStorageResult {
  GetUseCaseUserSecureStorageResult(this.result);
  final LoginEntity result;
}

class GetUserSecureStorageInfoUseCase
    extends UseCase<GetUseCaseUserSecureStorageResult, void> {
  GetUserSecureStorageInfoUseCase(this.localStorageRepository);

  final LocalStorageRepository localStorageRepository;

  @override
  Future<Either<Failure, GetUseCaseUserSecureStorageResult>> call(
    void params,
  ) async {
    try {
      final result = await localStorageRepository.getSecureStorage();
      return Right(GetUseCaseUserSecureStorageResult(result));
    } catch (e) {
      return Left(ErrorFailure());
    }
  }
}
