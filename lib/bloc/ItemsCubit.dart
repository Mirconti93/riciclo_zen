// Definizione del Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/ItemModel.dart';

class ItemsCubit extends Cubit<ItemsState> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  ItemsCubit() : super(ItemsState(const []));

  void addItems(List<ItemModel> items) {
    emit(ItemsState(items));
  }

  void notifyError() {
    emit(ErrorState("Error"));
  }

}