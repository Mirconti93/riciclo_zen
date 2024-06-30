import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/domain/datasource/RecycleDataSource.dart';
import 'package:riciclo_zen/domain/models/ItemModel.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';

import '../../commons/DataResponse.dart';

class ItemsRepositoryImpl extends ItemsRepository {
  final GetIt locator = GetIt.instance;

  @override
  Stream<DataResponse<List<ItemModel>>> fetchData() {
    RecycleDataSource dataSource =  locator<RecycleDataSource>();
    return dataSource.fetchItems();
  }

}