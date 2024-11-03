import 'dart:developer';

import 'package:get_it/get_it.dart';

import 'package:riciclo_zen/items/domain/ItemsRepository.dart';

import '../../commons/domain/DataResponse.dart';
import '../domain/ItemsDataSource.dart';
import '../domain/models/ItemModel.dart';


class ItemsRepositoryImpl extends ItemsRepository {
  final GetIt locator = GetIt.instance;

  @override
  Stream<DataResponse<List<ItemModel>>> fetchData() {
    ItemsDataSource dataSource =  locator<ItemsDataSource>();
    return dataSource.fetchItems();
  }

}