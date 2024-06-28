// Definizione del Cubit

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/domain/models/CityModel.dart';
import 'dart:developer';

import 'CityState.dart';

class CityCubit extends Cubit<CityState> {
  List<CityModel> itemList = [];

  CityCubit() : super(const CityState([]));

  void fetchData() async {
    var f = await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('City');
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
      log('db riciclo lenght: ${values.length}');
      List<CityModel> cityList = [];
      values.forEach((key, value) {
        log('db value: $value');
        cityList.add(CityModel(name: key, link: value));
      });
      itemList = cityList;
      emit(CityState(cityList));
    });

  }

  void filterData(String text) {
    emit(CityState(itemList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }

}