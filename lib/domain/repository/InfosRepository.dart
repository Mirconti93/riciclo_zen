import 'package:riciclo_zen/domain/models/CityModel.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';
import '../../commons/DataResponse.dart';

abstract class InfosRepository {
  Stream<DataResponse<List<InfoModel>>> fetchData();
}