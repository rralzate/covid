part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

// Post to login in the app /// -----------------------------------/// -----------------------------------/// -----------------------------------
class PostLoginEvent extends AuthEvent {
  final String documentType;
  final String documentNumber;
  final String password;

  const PostLoginEvent({
    required this.documentType,
    required this.documentNumber,
    required this.password,
  });

  @override
  List<Object> get props => [
        documentType,
        documentNumber,
        password,
      ];
}

// Post to register in the app /// -----------------------------------/// -----------------------------------/// -----------------------------------
class PostRegisterEvent extends AuthEvent {
  final String documentType;
  final String documentNumber;
  final String password;

  const PostRegisterEvent({
    required this.documentType,
    required this.documentNumber,
    required this.password,
  });

  @override
  List<Object> get props => [
        documentType,
        documentNumber,
        password,
      ];
}

class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  const ShowPasswordEvent(this.showPassword);
  @override
  List<Object?> get props => [];
}
