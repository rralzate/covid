part of 'states_bloc.dart';

sealed class StatesState extends Equatable {
  const StatesState();

  @override
  List<Object?> get props => [];
}

final class StatesInitial extends StatesState {}

// Get States information /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetStatesState extends StatesState {
  @override
  List<Object?> get props => [];
}

class LoadingGetStatesState extends StatesState {
  @override
  List<Object?> get props => [];
}

class SuccessGetStatesState extends StatesState {
  const SuccessGetStatesState(this.listStates);
  final List<StatesEntity> listStates;

  @override
  List<Object?> get props => [listStates];
}

class FailedGetStatesState extends StatesState {
  @override
  List<Object?> get props => [];
}

class GetStatesState extends StatesState {
  const GetStatesState(this.listStates);
  final List<StatesEntity> listStates;

  @override
  List<Object?> get props => [listStates];

  @override
  String toString() {
    return ''' 
      States  Entity: 
        States: ${listStates.toString()}
    ''';
  }
}
// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

// Get Current States information /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetStatesCurrentState extends StatesState {
  @override
  List<Object?> get props => [];
}

class LoadingGetStatesCurrentState extends StatesState {
  @override
  List<Object?> get props => [];
}

class SuccessGetStatesCurrentState extends StatesState {
  const SuccessGetStatesCurrentState(this.listStatesCurrent);
  final List<StatesCurrentEntity> listStatesCurrent;

  @override
  List<Object?> get props => [listStatesCurrent];
}

class FailedGetStatesCurrentState extends StatesState {
  @override
  List<Object?> get props => [];
}

class GetStatesCurrentState extends StatesState {
  const GetStatesCurrentState(this.listStatesCurrent);
  final List<StatesCurrentEntity> listStatesCurrent;

  @override
  List<Object?> get props => [listStatesCurrent];

  @override
  String toString() {
    return ''' 
      Current States  Entity: 
        Current States: ${listStatesCurrent.toString()}
    ''';
  }
}
// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------


