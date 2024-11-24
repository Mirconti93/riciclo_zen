import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/ItemModel.dart';

@immutable
abstract class ItemsState extends Equatable {
  List<Object> get props => [];
}

class ListState extends ItemsState {
  List<ItemModel> items;
  ListState(this.items);

  @override
  List<Object> get props => [items];
}


class ErrorState extends ItemsState {
  final String message;

  ErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class LoadingState extends ItemsState {
  LoadingState() : super();
}

