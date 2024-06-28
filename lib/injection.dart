import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:riciclo_zen/data/datasource/RecycleDataSourceImpl.dart';
import 'package:riciclo_zen/data/repository/CitiesRepositoryImpl.dart';
import 'package:riciclo_zen/data/repository/ItemsRepositoryImpl.dart';
import 'package:riciclo_zen/domain/repository/CitiesRepository.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<RecycleDataSourceImpl>(RecycleDataSourceImpl());
  getIt.registerSingleton<ItemsRepository>(ItemsRepositoryImpl());
  getIt.registerSingleton<CitiesRepository>(CitiesRepositoryImpl());
}