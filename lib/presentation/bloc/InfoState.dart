import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';

class InfoState extends Equatable {
  final List<InfoModel> infos;
  const InfoState(this.infos);

  @override
  List<Object> get props => [infos];
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




