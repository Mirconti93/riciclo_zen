import 'package:get_it/get_it.dart';
import '../../commons/domain/DataResponse.dart';
import '../../infos/domain/InfosRepository.dart';
import '../domain/InfosDataSource.dart';
import '../domain/models/InfoModel.dart';

class InfosRepositoryImpl extends InfosRepository {

  InfosDataSource dataSource =  GetIt.instance<InfosDataSource>();

  @override
  Stream<DataResponse<List<InfoModel>>> fetchData() {
    return dataSource.fetchInfos();
  }

}