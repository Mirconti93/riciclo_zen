import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';
import 'package:riciclo_zen/domain/repository/CitiesRepository.dart';

import '../../commons/DataResponse.dart';
import '../../domain/datasource/RecycleDataSource.dart';
import '../../domain/models/InfoModel.dart';
import '../../domain/repository/InfosRepository.dart';

class InfosRepositoryImpl extends InfosRepository {

  RecycleDataSource dataSource =  GetIt.instance<RecycleDataSource>();

  @override
  Stream<DataResponse<List<InfoModel>>> fetchData() {
    return dataSource.fetchInfos();
  }

}