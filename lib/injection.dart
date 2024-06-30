import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/data/datasource/RecycleDataSourceImpl.dart';
import 'package:riciclo_zen/data/repository/CitiesRepositoryImpl.dart';
import 'package:riciclo_zen/data/repository/ItemsRepositoryImpl.dart';
import 'package:riciclo_zen/domain/repository/CitiesRepository.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';
import 'domain/datasource/RecycleDataSource.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<RecycleDataSource>(RecycleDataSourceImpl());
  getIt.registerSingleton<ItemsRepository>(ItemsRepositoryImpl());
  getIt.registerSingleton<CitiesRepository>(CitiesRepositoryImpl());
}