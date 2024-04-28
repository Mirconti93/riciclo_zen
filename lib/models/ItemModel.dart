import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String name;
  final String material;
  final String comment;

  const ItemModel({required this.name, required this.material, required this.comment});

  @override
  List<Object?> get props => [name];

  factory ItemModel.fromJson(String nameFromKey, Map<dynamic, dynamic> json) {
    return ItemModel(
      name: nameFromKey,
      material: json['m1'],
      comment: json['comment']
    );
  }

}