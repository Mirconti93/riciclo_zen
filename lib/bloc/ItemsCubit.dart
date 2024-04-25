// Definizione del Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';

import '../models/ItemModel.dart';


class ItemsCubit extends Cubit<ItemsState> {

  ItemsCubit() : super(InitialState());

  void addTeams(List<ItemModel> teams) {
    emit(UpdateState(teams));
  }

  void addTeam(ItemModel team) {
    List<ItemModel> newList = List.from(state.props);
    newList.add(team);
    emit(UpdateState(newList));
  }

  void notifyError() {
    emit(ErrorState("Error"));
  }
}