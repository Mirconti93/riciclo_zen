import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/DataResponse.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';

import '../../domain/datasource/RecycleDataSource.dart';
import '../../domain/models/ItemModel.dart';

class RecycleDataSourceImpl extends RecycleDataSource{

  @override
  Stream<DataResponse<List<ItemModel>>> fetchItems()  {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(Constants.ITEMS_TABLE);
    return databaseReference.onValue.map((databaseEvent) {
      Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
      if (values != null) {
        if (values.isEmpty) {
          log("Empty list");
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
        log("Null values");
        return const DataError(Constants.ERROR_DATA_FETCH);
      }
    });
  }

  @override
  Stream<DataResponse<List<CityModel>>> fetchCities()  {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(Constants.CITY_TABLE);
    return databaseReference.onValue.map((databaseEvent) {
      Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
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
    });
  }

  @override
  Stream<DataResponse<List<InfoModel>>> fetchInfos()  {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(Constants.INFO_TABLE);
    return databaseReference.onValue.map((databaseEvent) {
      Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
      if (values != null) {
        if (values.isEmpty) {
          return const DataError(Constants.EMPTY_LIST);
        } else {
          List<InfoModel> items = [];
          values.forEach((key, value) {
            items.add(InfoModel.fromJson(key, value));
          });
          return DataSuccess(items);
        }
      } else {
        return const DataError(Constants.ERROR_DATA_FETCH);
      }
    });
  }


}
