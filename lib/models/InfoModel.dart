import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String name;
  final String link;

  const InfoModel({required this.name, required this.link});

  @override
  List<Object?> get props => [name];

}