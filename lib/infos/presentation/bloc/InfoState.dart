import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/InfoModel.dart';

@immutable
abstract class InfoState extends Equatable {
  List<Object> get props => [];
}

class ListState extends InfoState {
  final List<InfoModel> infos;
  ListState(this.infos);

  @override
  List<Object> get props => [infos];

  get cityList => null;
}

class ErrorState extends InfoState {
  final String message;

  ErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class LoadingState extends InfoState {
  LoadingState() : super();
}




