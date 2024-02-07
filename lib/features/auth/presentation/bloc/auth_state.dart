part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool showPassword;

  const AuthState({
    this.showPassword = false,
  });

  AuthState copyWith({
    bool? showPassword,
  }) =>
      AuthState(
        showPassword: showPassword ?? this.showPassword,
      );

  @override
  List<Object?> get props => [
        showPassword,
      ];
}

// Class for login State /// -----------------------------------/// -----------------------------------/// -----------------------------------

class LoadingPostLoginState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedPostLoginState extends AuthState {
  final String error;

  const FailedPostLoginState({
    required this.error,
  });
  @override
  List<Object?> get props => [
        error,
      ];
}

class PostLoginState extends AuthState {
  final bool result;

  const PostLoginState({
    required this.result,
  });

  @override
  List<Object?> get props => [result];

  @override
  String toString() {
    return ''' 
      Get: 
        result : ${result.toString()}
    ''';
  }
}

class SuccessPostLoginState extends AuthState {
  final bool result;

  const SuccessPostLoginState({
    required this.result,
  });

  @override
  List<Object?> get props => [];
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

// Class for register State /// -----------------------------------/// -----------------------------------/// -----------------------------------

class LoadingPostRegisterState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedPostRegisterState extends AuthState {
  final String error;

  const FailedPostRegisterState({
    required this.error,
  });
  @override
  List<Object?> get props => [
        error,
      ];
}

class PostRegisterState extends AuthState {
  final LoginEntity result;

  const PostRegisterState({
    required this.result,
  });

  @override
  List<Object?> get props => [result];

  @override
  String toString() {
    return ''' 
      Get: 
        result : ${result.toString()}
    ''';
  }
}

class SuccessPostRegisterState extends AuthState {
  final LoginEntity result;

  const SuccessPostRegisterState({
    required this.result,
  });

  @override
  List<Object?> get props => [];
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

