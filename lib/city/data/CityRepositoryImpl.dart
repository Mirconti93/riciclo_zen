import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/city/domain/CityRepository.dart';

import '../../commons/domain/DataResponse.dart';
import '../domain/CityDataSource.dart';
import '../domain/models/CityModel.dart';

class CityRepositoryImpl extends CityRepository {

  CityDataSource dataSource =  GetIt.instance<CityDataSource>();

  @override
  Stream<DataResponse<List<CityModel>>> fetchData() {
    return dataSource.fetchCities();
  }

}