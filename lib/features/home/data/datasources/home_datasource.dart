import '../model/device_model.dart';

abstract class HomeDatasource {
  Future<List<DeviceModel>> getCovidInformation();
}
