import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';

import '../domain/models/ItemModel.dart';

class WebState extends Equatable {
  final String url;
  const WebState(this.url);

  @override
  List<Object> get props => [url];
}



