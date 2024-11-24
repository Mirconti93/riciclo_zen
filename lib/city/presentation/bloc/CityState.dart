import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/CityModel.dart';

@immutable
abstract class CityState extends Equatable {
  List<Object> get props => [];
}

class ListState extends CityState {
  final List<CityModel> cityList;

  ListState(this.cityList) : super();

  @override
  List<Object> get props => [cityList];
}

class ErrorState extends CityState {
  final String message;

  ErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class LoadingState extends CityState {
  LoadingState() : super();
}

