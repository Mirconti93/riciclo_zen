import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import '../../commons/domain/DataResponse.dart';
import '../domain/ItemsDataSource.dart';
import '../domain/models/ItemModel.dart';


class ItemsDataSourceImpl extends ItemsDataSource {

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

}
