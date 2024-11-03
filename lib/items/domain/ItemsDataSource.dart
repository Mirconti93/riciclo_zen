import 'dart:developer';

import '../../commons/domain/DataResponse.dart';
import '../domain/models/ItemModel.dart';

abstract class ItemsDataSource {

  Stream<DataResponse<List<ItemModel>>> fetchItems();

}
