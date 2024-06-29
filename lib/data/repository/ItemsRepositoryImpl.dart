import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/domain/datasource/RecycleDataSource.dart';
import 'package:riciclo_zen/domain/models/ItemModel.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';

import '../../commons/DataResponse.dart';

class ItemsRepositoryImpl extends ItemsRepository {
  final GetIt locator = GetIt.instance;

  List<ItemModel> _itemList = [];

  @override
  Future<DataResponse<List<ItemModel>>> fetchData() async {
    if (!_itemList.isEmpty) {
      return Future.value(DataSuccess(_itemList));
    } else {
      RecycleDataSource dataSource =  locator<RecycleDataSource>();
      return dataSource.fetchItems();
    }
  }

}