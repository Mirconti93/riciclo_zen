import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';

class InfoState extends Equatable {
  final List<InfoModel> infos;
  const InfoState(this.infos);

  @override
  List<Object> get props => [infos];
}



