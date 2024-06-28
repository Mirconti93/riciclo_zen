import 'package:equatable/equatable.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';

class InfoState extends Equatable {
  final List<InfoModel> list;
  const InfoState(this.list);

  @override
  List<Object> get props => [list];
}



