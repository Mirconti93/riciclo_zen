import 'dart:developer';

import '../../commons/DataResponse.dart';
import '../../domain/models/ItemModel.dart';
import '../models/CityModel.dart';
import '../models/InfoModel.dart';

abstract class RecycleDataSource {

  Stream<DataResponse<List<ItemModel>>> fetchItems();
  Stream<DataResponse<List<CityModel>>> fetchCities();
  Stream<DataResponse<List<InfoModel>>> fetchInfos();

}
