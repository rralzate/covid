import 'dart:convert';

import 'package:covid/features/home/data/model/device_model.dart';

import '../../../../core/network/server_api_client.dart';
import '../../../../core/network/server_api_constants.dart';
import 'home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final ServerApiClient apiClient;

  HomeDatasourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<DeviceModel>> getCovidInformation() async {
    List<DeviceModel> deviceModelFromJson(String str) => List<DeviceModel>.from(
        json.decode(str).map((x) => DeviceModel.fromJson(x)));

    final result = await apiClient.get(
      ServerApiConstants.currentEndpoint,
    );

    return deviceModelFromJson(result.body);
  }
}
