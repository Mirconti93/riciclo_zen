import 'dart:developer';

import '../../commons/domain/DataResponse.dart';
import 'models/CityModel.dart';

abstract class CityDataSource {

  Stream<DataResponse<List<CityModel>>> fetchCities();

}
