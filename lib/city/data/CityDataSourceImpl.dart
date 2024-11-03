import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/commons/Constants.dart';

import '../../commons/domain/DataResponse.dart';
import '../domain/CityDataSource.dart';
import '../domain/models/CityModel.dart';

class CityDataSourceImpl extends CityDataSource{

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




}
