import 'dart:convert';

import 'package:covid/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.documentType,
    required super.documentNumber,
    required super.password,
  });

  factory LoginModel.loginModelFromJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String loginModelToJson(LoginModel data) => json.encode(data.toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        documentType: json["documentType"],
        documentNumber: json["documentNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType,
        "documentNumber": documentNumber,
        "password": password,
      };
}
