import 'dart:convert';

class LoginModel {
  final String documentType;
  final int documentNumber;
  final String password;

  LoginModel({
    required this.documentType,
    required this.documentNumber,
    required this.password,
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
