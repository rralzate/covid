import 'package:covid/features/states/domain/entities/states_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usescases/get_list_states_current_usecase.dart';
import '../../domain/usescases/get_list_states_usescase.dart';

part 'states_event.dart';
part 'states_state.dart';

class StatesBloc extends Bloc<StatesEvent, StatesState> {
  final GetListStatesUseCase getListStatesUseCase;
  final GetListStatesCurrentUseCase getListStatesCurrentUseCase;

  StatesBloc({
    required this.getListStatesUseCase,
    required this.getListStatesCurrentUseCase,
  }) : super(StatesInitial()) {
    on<GetStatesEvents>((event, emit) async {
      emit(await _getStates(event: event, emit: emit));
    });
  }

  Future<StatesState> _getStates({
    required GetStatesEvents event,
    required Emitter<StatesState> emit,
  }) async {
    emit(LoadingGetStatesState());
    final result = await getListStatesUseCase(
      NoParams(),
    );

    return result.fold(
      (l) {
        emit(FailedGetStatesState());
        return const GetStatesState([]);
      },
      (resp) {
        emit(SuccessGetStatesState(resp));
        return GetStatesState(resp);
      },
    );
  }

  Future<StatesState> _getStatesCurrent({
    required GetStatesEvents event,
    required Emitter<StatesState> emit,
  }) async {
    emit(LoadingGetStatesState());
    final result = await getListStatesUseCase(
      NoParams(),
    );

    return result.fold(
      (l) {
        emit(FailedGetStatesState());
        return const GetStatesState([]);
      },
      (resp) {
        emit(SuccessGetStatesState(resp));
        return GetStatesState(resp);
      },
    );
  }
}
