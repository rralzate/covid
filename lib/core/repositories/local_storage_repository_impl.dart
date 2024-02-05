import 'dart:convert';

import 'package:covid/features/auth/data/models/login_model.dart';

import 'package:covid/features/auth/domain/entities/login_entity.dart';

import '../utils/share_preferences_actions.dart';
import 'local_storage_repository.dart';

const _userCredentialsStorageKey = 'user_credentials';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<LoginEntity> getSecureStorage() async {
    String storage = await SharePreferencesAction.getActionFromSecureStorage(
      key: _userCredentialsStorageKey,
    );
    if (storage.isEmpty) {
      return const LoginEntity.empty();
    } else {
      return LoginEntity.fromJson(jsonDecode(storage));
    }
  }

  @override
  Future<LoginEntity> setSecureStorage({required LoginModel model}) async {
    await SharePreferencesAction.setActionFromSecureStorage(
      key: _userCredentialsStorageKey,
      value: jsonEncode(model.toJson()),
    );
    return LoginEntity(
        documentType: model.documentType,
        documentNumber: model.documentNumber,
        password: model.password);
  }
}
