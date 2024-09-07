import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String name;
  final String description;
  final String link;

  const InfoModel({required this.name, required this.description, required this.link});

  @override
  List<Object?> get props => [name];

  factory InfoModel.fromJson(String nameFromKey, Map<dynamic, dynamic> json) {
    return InfoModel(
        name: nameFromKey,
        description: json['description'],
        link: json['link']
    );
  }

}