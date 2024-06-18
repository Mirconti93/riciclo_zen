// Definizione del Cubit

import 'dart:convert';

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/data/datasource/ItemsDataSourceImpl.dart';
import 'package:riciclo_zen/data/repository/ItemsRepositoryImpl.dart';
import '../domain/models/ItemModel.dart';
import 'ItemsState.dart';

class ItemsCubit extends Cubit<ItemsState> {
  List<ItemModel> itemList = [];

  ItemsCubit() : super(ItemsState(const []));

  void fetchData() async {
    ItemsDataSourceImpl().fetchData().then(
      (data) => {
        if (data != null) {
          emit(ItemsState(data))
        }
      }
    ).catchError(() => log('Error fetching data'));


    // await Firebase.initializeApp();
    // DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');
    // _databaseReference.onValue.listen((DatabaseEvent event) {
    //   Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
    //   if (values.isEmpty) {
    //     notifyError("Nessun elemento trovato");
    //   } else {
    //     log('db riciclo lenght: ${values.length}');
    //     List<ItemModel> items = [];
    //     values.forEach((key, value) {
    //       log('db value: $value');
    //       items.add(ItemModel.fromJson(key, value));
    //     });
    //     itemList = items;
    //     emit(ItemsState(items));
    //   }
    // });

  }

  void filterData(String text) {
    emit(ItemsState(itemList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }

  void notifyError(String message) {
    emit(ErrorState(message));
  }

}