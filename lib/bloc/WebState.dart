import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/models/CityModel.dart';

import '../models/ItemModel.dart';

class WebState extends Equatable {
  final String url;
  const WebState(this.url);

  @override
  List<Object> get props => [url];
}



