import 'dart:convert';

import 'package:covid/features/states/data/models/states_current_model.dart';

import 'package:covid/features/states/data/models/states_model.dart';

import '../../../../core/network/server_api_client.dart';
import '../../../../core/network/server_api_constants.dart';
import 'states_datasource.dart';

class StatesDatasourceImpl implements StatesDatasource {
  final ServerApiClient apiClient;

  StatesDatasourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<StatesModel>> getStates() async {
    List<StatesModel> statesModelFromJson(String str) => List<StatesModel>.from(
        json.decode(str).map((x) => StatesModel.fromJson(x)));

    final result = await apiClient.get(
      ServerApiConstants.statesEndpoint,
    );
    return statesModelFromJson(result.body);
  }

  @override
  Future<List<StatesCurrentModel>> getStatesCurrent() async {
    List<StatesCurrentModel> statesCurrentModelFromJson(String str) =>
        List<StatesCurrentModel>.from(
            json.decode(str).map((x) => StatesCurrentModel.fromJson(x)));

    final result = await apiClient.get(
      ServerApiConstants.statesCurrentEndpoint,
    );

    return statesCurrentModelFromJson(result.body);
  }
}
