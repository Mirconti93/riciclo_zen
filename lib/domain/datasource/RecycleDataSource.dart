import 'dart:developer';

import '../../commons/DataResponse.dart';
import '../../domain/models/ItemModel.dart';
import '../models/CityModel.dart';

abstract class RecycleDataSource {

  Future<DataResponse<List<ItemModel>>> fetchItems();
  Future<DataResponse<List<CityModel>>> fetchCities();

}
