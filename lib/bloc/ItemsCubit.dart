// Definizione del Cubit

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/ItemModel.dart';
import 'dart:developer';

class ItemsCubit extends Cubit<ItemsState> {


  ItemsCubit() : super(ItemsState(const []));

  void fetchData() async {
    var f = await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');

    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
      log('db riciclo: ${values.length}');
      List<ItemModel> items = [];
      values.forEach((key, value) {
        log('db value: $value');
        items.add(ItemModel(name: key, matefrial: value));
      });
      emit(ItemsState(items));
    });

  }




  void addItems(List<ItemModel> items) {
    emit(ItemsState(items));
  }

  void notifyError() {
    emit(ErrorState("Error"));
  }

}