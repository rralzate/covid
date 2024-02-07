import 'package:covid/core/usecases/usecase.dart';
import 'package:covid/features/home/domain/entities/device_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usescases/get_covid_information_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCovidInformationUseCase getCovidInformationUseCase;

  HomeBloc({
    required this.getCovidInformationUseCase,
  }) : super(HomeInitial()) {
    on<GetCovidInformationEvents>((event, emit) async {
      emit(await _getCovidInformation(event: event, emit: emit));
    });
  }

  Future<HomeState> _getCovidInformation({
    required GetCovidInformationEvents event,
    required Emitter<HomeState> emit,
  }) async {
    emit(LoadingGetCovidInformationState());
    final result = await getCovidInformationUseCase(
      NoParams(),
    );

    return result.fold(
      (l) {
        emit(FailedGetCovidInformationState());
        return GetCovidInformationState(DeviceEntity.empty());
      },
      (resp) {
        emit(SuccessGetCovidInformationState(resp));
        return GetCovidInformationState(resp);
      },
    );
  }
}
