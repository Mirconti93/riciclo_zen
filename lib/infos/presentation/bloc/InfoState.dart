import 'package:equatable/equatable.dart';

import '../../domain/models/InfoModel.dart';

class InfoState extends Equatable {
  final List<InfoModel> infos;
  const InfoState(this.infos);

  @override
  List<Object> get props => [infos];

  get cityList => null;
}


class ErrorState extends InfoState {
  final String message;

  ErrorState(this.message) : super([]);

  @override
  List<Object> get props => [message];
}

class LoadingState extends InfoState {
  LoadingState() : super([]);

}




