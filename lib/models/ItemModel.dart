import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final String name;
  final String material;

  const ItemModel({required this.name, required this.material});

  @override
  List<Object?> get props => [name];

  factory ItemModel.fromJson(String nameFromKey, Map<String, dynamic> json) {
    return ItemModel(
      name: nameFromKey,
      material: json['m1'],
    );
  }

}