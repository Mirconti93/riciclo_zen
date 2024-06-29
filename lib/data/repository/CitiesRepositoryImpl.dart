import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';
import 'package:riciclo_zen/domain/repository/CitiesRepository.dart';

import '../../commons/DataResponse.dart';
import '../../domain/datasource/RecycleDataSource.dart';

class CitiesRepositoryImpl extends CitiesRepository {
  RecycleDataSource dataSource =  GetIt.instance<RecycleDataSource>();

  @override
  Future<DataResponse<List<CityModel>>> fetchData() {
    return dataSource.fetchCities();
  }

}