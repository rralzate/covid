import 'package:covid/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:covid/features/home/data/respositories/home_repository_impl.dart';
import 'package:covid/features/home/domain/repositories/home_repository.dart';
import 'package:covid/features/home/presentation/bloc/home_bloc.dart';
import 'package:covid/features/states/presentation/bloc/states_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'core/network/server_api_client.dart';
import 'core/repositories/local_storage_repository.dart';
import 'core/repositories/local_storage_repository_impl.dart';
import 'features/auth/data/datasources/auth_datasouce_impl.dart';
import 'features/auth/data/datasources/auth_datasource.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/post_login_use_case.dart';
import 'features/auth/domain/usecases/post_register_use_case.dart';
import 'features/home/data/datasources/home_datasource.dart';
import 'features/home/data/datasources/home_datasource_impl.dart';
import 'features/home/domain/usescases/get_covid_information_usecase.dart';
import 'features/states/data/datasources/states_datasource.dart';
import 'features/states/data/datasources/states_datasource_impl.dart';
import 'features/states/data/repositories/states_repository_impl.dart';
import 'features/states/domain/repositories/states_repository.dart';
import 'features/states/domain/usescases/get_list_states_current_usecase.dart';
import 'features/states/domain/usescases/get_list_states_usescase.dart';
import 'features/states/domain/usescases/get_region_detail_usescase.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  //! Features Covid 19

  //BLOC

  getIt.registerFactory(
    () => AuthBloc(postLoginUseCase: getIt(), postRegisterUseCase: getIt()),
  );

  getIt.registerFactory(
    () => HomeBloc(getCovidInformationUseCase: getIt()),
  );

  getIt.registerFactory(
    () => StatesBloc(
      getListStatesUseCase: getIt(),
      getListStatesCurrentUseCase: getIt(),
      getRegionDetailUseCase: getIt(),
    ),
  );

  // Use cases
  //Login
  getIt.registerLazySingleton(() => PostLoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => PostRegisterUseCase(repository: getIt()));

  //Home
  getIt.registerLazySingleton(
      () => GetCovidInformationUseCase(repository: getIt()));

  //States
  getIt.registerLazySingleton(() => GetListStatesUseCase(repository: getIt()));

  getIt.registerLazySingleton(
      () => GetListStatesCurrentUseCase(repository: getIt()));

  getIt
      .registerLazySingleton(() => GetRegionDetailUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      authDataSource: getIt(),
      localStorageRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<StatesRepository>(
    () => StatesRepositoryImpl(
      statesDatasource: getIt(),
    ),
  );

  //Data Source
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDatasouceImpl());

  getIt.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl(
        apiClient: getIt(),
      ));

  getIt.registerLazySingleton<StatesDatasource>(() => StatesDatasourceImpl(
        apiClient: getIt(),
      ));

  // local storage actions
  getIt.registerLazySingleton<LocalStorageRepository>(
      () => LocalStorageRepositoryImpl());

  //Server Api Client to Http consume rest apis
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
    ),
  );

  //!Core
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
      () => NetworkInfoRepositoryImpl());
}
