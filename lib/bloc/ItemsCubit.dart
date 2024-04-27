// Definizione del Cubit
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/ItemModel.dart';
import 'dart:developer';

class ItemsCubit extends Cubit<ItemsState> {


  ItemsCubit() : super(ItemsState(const []));

  void fetchData() {
    Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');
    log('db riciclo: ${_databaseReference.key}');
  }


  void addItems(List<ItemModel> items) {
    emit(ItemsState(items));
  }

  void notifyError() {
    emit(ErrorState("Error"));
  }

}