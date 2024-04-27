import 'package:equatable/equatable.dart';

import '../models/ItemModel.dart';

class ItemsState extends Equatable {
  List<ItemModel> items;
  ItemsState(this.items);

  @override
  List<Object> get props => [items];
}


class ErrorState extends ItemsState {
  final String message;

  ErrorState(this.message) : super([]);

  @override
  List<Object> get props => [message];
}

