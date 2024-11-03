import '../../commons/domain/DataResponse.dart';
import 'models/InfoModel.dart';

abstract class InfosRepository {
  Stream<DataResponse<List<InfoModel>>> fetchData();
}