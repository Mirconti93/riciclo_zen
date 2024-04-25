import 'package:equatable/equatable.dart';

import '../models/ItemModel.dart';

abstract class ItemsState extends Equatable {
  List<ItemModel> get teamList => [];

}

class InitialState extends ItemsState {
  List<ItemModel> teams = [];
  @override
  List<Object> get props => [teams];
}

class UpdateState extends ItemsState {
  List<ItemModel> teams = [];

  UpdateState(this.teams);

  @override
  List<ItemModel> get teamList => teams;

  @override
  List<Object> get props => [teams];
}

class ErrorState extends ItemsState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

