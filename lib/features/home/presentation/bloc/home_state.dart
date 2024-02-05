part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

// Get Covid information /// -----------------------------------/// -----------------------------------/// -----------------------------------
class InitGetCovidInformationState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingGetCovidInformationState extends HomeState {
  @override
  List<Object?> get props => [];
}

class SuccessGetCovidInformationState extends HomeState {
  const SuccessGetCovidInformationState(this.deviceEntity);
  final DeviceEntity deviceEntity;

  @override
  List<Object?> get props => [deviceEntity];
}

class FailedGetCovidInformationState extends HomeState {
  @override
  List<Object?> get props => [];
}

class GetCovidInformationState extends HomeState {
  const GetCovidInformationState(this.deviceEntity);
  final DeviceEntity deviceEntity;

  @override
  List<Object?> get props => [deviceEntity];

  @override
  String toString() {
    return ''' 
      Device Detail Entity: 
        Device: ${deviceEntity.toString()}
    ''';
  }
}
// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

