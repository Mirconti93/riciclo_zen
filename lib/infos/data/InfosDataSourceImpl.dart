import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import '../../commons/domain/DataResponse.dart';
import '../domain/models/InfoModel.dart';
import '../domain/InfosDataSource.dart';

class InfosDataSourceImpl extends InfosDataSource {

  @override
  Stream<DataResponse<List<InfoModel>>> fetchInfos()  {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref(Constants.INFO_TABLE);
    return databaseReference.onValue.map((databaseEvent) {
      Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
      if (values != null) {
        if (values.isEmpty) {
          log("INFOFETCH empty list" );
          return const DataError(Constants.EMPTY_LIST);
        } else {
          List<InfoModel> items = [];
          log("INFOFETCH values:" + values.toString() );
          values.forEach((key, value) {
            items.add(InfoModel.fromJson(key, value));
          });
          return DataSuccess(items);
        }
      } else {
        log("INFOFETCH error fetch" );
        return const DataError(Constants.ERROR_DATA_FETCH);
      }
    });
  }

}
