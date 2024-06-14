import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  final String name;
  final String link;

  const CityModel({required this.name, required this.link});

  @override
  List<Object?> get props => [name];

}