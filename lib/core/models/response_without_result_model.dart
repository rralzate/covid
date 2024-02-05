import '../entities/response_without_result_entity.dart';
import 'message.dart';

class ResponseWithoutResultModel extends ResponseWithoutResultEntity {
  const ResponseWithoutResultModel({
    required super.success,
    required super.messageResponse,
  });
  //

  factory ResponseWithoutResultModel.fromJson(Map<String, dynamic> json) {
    MessageResponseModel messageResponseModel = MessageResponseModel(
      title: json["Mensaje"],
      description: json["Mensaje"],
    );

    if (json.containsKey("message")) {
      messageResponseModel = MessageResponseModel.fromJson(json["message"]);
    }

    return ResponseWithoutResultModel(
      success: (json['success'] ?? false) as bool,
      messageResponse: messageResponseModel,
    );
  }
}
