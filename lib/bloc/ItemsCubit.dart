// Definizione del Cubit

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/ItemModel.dart';
import 'dart:developer';

class ItemsCubit extends Cubit<ItemsState> {

  ItemsCubit() : super(ItemsState(const []));

  void fetchData() async {
    await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
      log('db riciclo lenght: ${values.length}');
      List<ItemModel> items = [];
      values.forEach((key, value) {
        log('db value: $value');
        items.add(ItemModel.fromJson(key, value));
      });
      emit(ItemsState(items));
    });

  }

  void filterData(String text) {
    emit(ItemsState(state.items.where((element) => element.name.contains(text)).toList()));
  }

  void notifyError() {
    emit(ErrorState("Error"));
  }

}