import 'dart:developer';

import '../../commons/domain/DataResponse.dart';
import '../domain/models/InfoModel.dart';

abstract class InfosDataSource {

  Stream<DataResponse<List<InfoModel>>> fetchInfos();

}
