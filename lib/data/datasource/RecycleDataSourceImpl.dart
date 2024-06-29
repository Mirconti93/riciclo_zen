import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/DataResponse.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';

import '../../domain/datasource/RecycleDataSource.dart';
import '../../domain/models/ItemModel.dart';

class RecycleDataSourceImpl extends RecycleDataSource{

  @override
  Future<DataResponse<List<ItemModel>>> fetchItems() async {
    Map<dynamic, dynamic>? values = fetchFromFirebaseDatabase(Constants.ITEMS_TABLE);
    if (values != null) {
      if (values.isEmpty) {
        log("DataError 1:");
        return const DataError(Constants.EMPTY_LIST);
      } else {
        List<ItemModel> items = [];
        values.forEach((key, value) {
          items.add(ItemModel.fromJson(key, value));
        });
        log("DataSuccess, items:" + items.length.toString());
        return DataSuccess(items);
      }
    } else {
      log("DataError:");
      return const DataError(Constants.ERROR_DATA_FETCH);
    }
  }

  @override
  Future<DataResponse<List<CityModel>>> fetchCities() async {
    Map<dynamic, dynamic>? values = fetchFromFirebaseDatabase(Constants.CITY_TABLE);
    if (values != null) {
      if (values.isEmpty) {
        return const DataError(Constants.EMPTY_LIST);
      } else {
        List<CityModel> items = [];
        values.forEach((key, value) {
          items.add(CityModel(name: key, link: value));
        });
        return DataSuccess(items);
      }
    } else {
      return const DataError(Constants.ERROR_DATA_FETCH);
    }
  }

  Map<dynamic, dynamic>? fetchFromFirebaseDatabase(String ref) {
    Map<dynamic, dynamic>? values;
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(ref);
    databaseReference.onValue.listen((DatabaseEvent event) {
      values = event.snapshot.value as Map<dynamic, dynamic>;
    });
    return values;
  }

}
