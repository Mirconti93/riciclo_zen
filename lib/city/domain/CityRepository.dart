import '../../commons/domain/DataResponse.dart';
import 'models/CityModel.dart';

abstract class CityRepository {
  Stream<DataResponse<List<CityModel>>> fetchData();
}