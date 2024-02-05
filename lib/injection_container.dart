import 'package:covid/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/repositories/local_storage_repository.dart';
import 'core/repositories/local_storage_repository_impl.dart';
import 'features/auth/data/datasources/auth_datasouce_impl.dart';
import 'features/auth/data/datasources/auth_datasource.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/post_login_use_case.dart';
import 'features/auth/domain/usecases/post_register_use_case.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  //! Features Covid 19

  //BLOC

  getIt.registerFactory(
    () => AuthBloc(postLoginUseCase: getIt(), postRegisterUseCase: getIt()),
  );

  // Use cases
  //Login
  getIt.registerLazySingleton(() => PostLoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => PostRegisterUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      authDataSource: getIt(),
      localStorageRepository: getIt(),
    ),
  );

  //Data Source
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDatasouceImpl(

      // apiClient: getIt(),
      ));

  // local storage actions
  getIt.registerLazySingleton<LocalStorageRepository>(
      () => LocalStorageRepositoryImpl());
}
