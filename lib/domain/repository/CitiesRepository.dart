import 'package:riciclo_zen/domain/models/CityModel.dart';
import '../../commons/DataResponse.dart';

abstract class CitiesRepository {
  Future<DataResponse<List<CityModel>>> fetchData();
}