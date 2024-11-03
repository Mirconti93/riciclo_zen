import 'package:equatable/equatable.dart';

import '../../domain/models/CityModel.dart';

class CityState extends Equatable {
  final List<CityModel> cityList;
  const CityState(this.cityList);

  @override
  List<Object> get props => [cityList];
}

class ErrorState extends CityState {
  final String message;

  ErrorState(this.message) : super([]);

  @override
  List<Object> get props => [message];
}

class LoadingState extends CityState {
  LoadingState() : super([]);
}

