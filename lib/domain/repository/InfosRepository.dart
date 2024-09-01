import 'package:riciclo_zen/domain/models/CityModel.dart';
import '../../commons/DataResponse.dart';

abstract class CitiesRepository {
  Stream<DataResponse<List<CityModel>>> fetchData();
}