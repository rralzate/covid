part of 'states_bloc.dart';

sealed class StatesEvent extends Equatable {
  const StatesEvent();

  @override
  List<Object> get props => [];
}

// Get Covid Information /// -----------------------------------/// -----------------------------------/// -----------------------------------

class GetStatesEvents extends StatesEvent {
  @override
  List<Object> get props => [];
}

class GetStatesCurrentEvents extends StatesEvent {
  @override
  List<Object> get props => [];
}

class GetRegionDetailEvents extends StatesEvent {
  final String regionState;

  const GetRegionDetailEvents({required this.regionState});
  @override
  List<Object> get props => [
        regionState,
      ];
}
