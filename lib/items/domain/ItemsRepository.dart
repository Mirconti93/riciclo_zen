import 'package:get_it/get_it.dart';

import '../../commons/domain/DataResponse.dart';
import 'models/ItemModel.dart';


abstract class ItemsRepository {

  Stream<DataResponse<List<ItemModel>>> fetchData();

}