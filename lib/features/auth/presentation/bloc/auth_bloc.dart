import 'package:covid/features/auth/domain/entities/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecases/post_login_use_case.dart';
import '../../domain/usecases/post_register_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PostLoginUseCase postLoginUseCase;
  final PostRegisterUseCase postRegisterUseCase;

  final _documentTypeController = BehaviorSubject<String>();
  final _documentNumberController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get documentTypeStream => _documentTypeController.stream;
  Stream<String> get documentNumberStream => _documentNumberController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  AuthBloc({
    required this.postLoginUseCase,
    required this.postRegisterUseCase,
  }) : super(const AuthState()) {
    on<ShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(showPassword: event.showPassword)));

    on<PostLoginEvent>((event, emit) async {
      emit(await _postLogin(event: event, emit: emit));
    });

    on<PostRegisterEvent>((event, emit) async {
      emit(await _postResgister(event: event, emit: emit));
    });
  }

  //validation of document type
  void updateDocumentType(String userDocumentType) async {
    if (userDocumentType.isEmpty) {
      _documentTypeController.sink.addError("Este campo es requerido");
    } else {
      _documentTypeController.sink.add(userDocumentType);
    }
  }

  //validation of document number
  void updateDocumentNumber(String userDocumentNumber) async {
    if (userDocumentNumber.isEmpty) {
      _documentNumberController.sink.addError("Este campo es requerido");
    } else if (int.parse(userDocumentNumber) <= 0) {
      _documentNumberController.sink.addError("Este campo debe ser mayor a 0");
    } else {
      _documentNumberController.sink.add(userDocumentNumber);
    }
  }

  //validation of document number
  void updatePassword(String userPassword) async {
    if (userPassword.isEmpty) {
      _passwordController.sink.addError("Este campo es requerido");
    } else {
      _passwordController.sink.add(userPassword);
    }
  }

  void dispose() {
    _documentTypeController.close();
    _documentNumberController.close();
    _documentTypeController.close();
  }

  //check login validation form
  Stream<bool> get validateLoginForm => Rx.combineLatest3(
        documentNumberStream,
        documentTypeStream,
        passwordStream,
        (a, b, c) => true,
      );

  //Method to login into de application
  Future<AuthState> _postLogin({
    required PostLoginEvent event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingPostLoginState());
    final user = await postLoginUseCase(ParamsUseCasePostLogin(
        loginEntity: LoginEntity(
      documentType: event.documentType,
      documentNumber: int.parse(
        event.documentNumber,
      ),
      password: event.password,
    )));

    return user.fold((failure) {
      emit(FailedPostLoginState(
        error: failure.props.isNotEmpty ? failure.props.first.toString() : '',
      ));

      return const PostLoginState(
        result: false,
      );
    }, (response) {
      emit(SuccessPostLoginState(result: response));

      return PostLoginState(result: response);
    });
  }

  //Method to login into de application
  Future<AuthState> _postResgister({
    required PostRegisterEvent event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingPostRegisterState());
    final user = await postRegisterUseCase(ParamsUseCasePostRegister(
        loginEntity: LoginEntity(
      documentType: event.documentType,
      documentNumber: int.parse(
        event.documentNumber,
      ),
      password: event.password,
    )));

    return user.fold((failure) {
      emit(FailedPostRegisterState(
        error: failure.props.isNotEmpty ? failure.props.first.toString() : '',
      ));

      return const PostRegisterState(
        result: LoginEntity.empty(),
      );
    }, (response) {
      emit(SuccessPostRegisterState(result: response));

      return PostRegisterState(result: response);
    });
  }
}
