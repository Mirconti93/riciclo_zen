import 'dart:developer';

import '../../commons/DataResponse.dart';
import '../../domain/models/ItemModel.dart';
import '../models/CityModel.dart';

abstract class RecycleDataSource {

  Stream<DataResponse<List<ItemModel>>> fetchItems();
  Stream<DataResponse<List<CityModel>>> fetchCities();
  Stream<DataResponse<List<CityModel>>> fetchInfos();

}
