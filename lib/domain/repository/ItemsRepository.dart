import '../../commons/DataResponse.dart';
import '../models/ItemModel.dart';

abstract class ItemsRepository {

  Future<DataResponse<List<ItemModel>>> fetchData();

}