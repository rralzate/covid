import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String documentType;
  final int documentNumber;
  final String password;

  const LoginEntity({
    required this.documentType,
    required this.documentNumber,
    required this.password,
  });

  const LoginEntity.empty()
      : documentNumber = 0,
        documentType = "",
        password = "";

  @override
  List<Object?> get props => [
        documentType,
        documentNumber,
        password,
      ];

  @override
  String toString() {
    return ''' 
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    Event Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      Document Type: $documentType,
      Document Number: ${documentNumber.toString()},
      Password: ${password.toString()},
    ''';
  }
}
