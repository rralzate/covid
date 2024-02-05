import '../../features/auth/data/models/login_model.dart';
import '../../features/auth/domain/entities/login_entity.dart';

abstract class LocalStorageRepository {
  Future<LoginEntity> getSecureStorage();
  Future<LoginEntity> setSecureStorage({required LoginModel model});
}
