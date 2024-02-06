import 'package:covid/features/states/data/models/states_model.dart';

import '../models/states_current_model.dart';

abstract class StatesDatasource {
  Future<List<StatesModel>> getStates();

  Future<List<StatesCurrentModel>> getStatesCurrent();
}
