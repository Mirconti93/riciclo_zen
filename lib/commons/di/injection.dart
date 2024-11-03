import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/city/domain/CityRepository.dart';
import 'package:riciclo_zen/infos/domain/InfosRepository.dart';
import 'package:riciclo_zen/items/domain/ItemsRepository.dart';
import '../../city/data/CityDataSourceImpl.dart';
import '../../city/data/CityRepositoryImpl.dart';
import '../../city/domain/CityDataSource.dart';
import '../../infos/data/InfosDataSourceImpl.dart';
import '../../infos/data/InfosRepositoryImpl.dart';
import '../../infos/domain/InfosDataSource.dart';
import '../../items/data/ItemsDataSourceImpl.dart';
import '../../items/data/ItemsRepositoryImpl.dart';
import '../../items/domain/ItemsDataSource.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<CityDataSource>(CityDataSourceImpl());
  getIt.registerSingleton<ItemsDataSource>(ItemsDataSourceImpl());
  getIt.registerSingleton<InfosDataSource>(InfosDataSourceImpl());
  getIt.registerSingleton<ItemsRepository>(ItemsRepositoryImpl());
  getIt.registerSingleton<CityRepository>(CityRepositoryImpl());
  getIt.registerSingleton<InfosRepository>(InfosRepositoryImpl());
}