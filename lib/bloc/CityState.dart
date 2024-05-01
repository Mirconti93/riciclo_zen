import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/models/CityModel.dart';

import '../models/ItemModel.dart';

class CityState extends Equatable {
  final List<CityModel> cityList;
  const CityState(this.cityList);

  @override
  List<Object> get props => [cityList];
}



