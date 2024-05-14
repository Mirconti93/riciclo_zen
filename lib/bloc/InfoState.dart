import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/models/CityModel.dart';
import 'package:riciclo_zen/models/InfoModel.dart';

import '../models/ItemModel.dart';

class InfoState extends Equatable {
  final List<InfoModel> list;
  const InfoState(this.list);

  @override
  List<Object> get props => [list];
}



