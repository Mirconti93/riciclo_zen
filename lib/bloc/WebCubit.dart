// Definizione del Cubit

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/CityState.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riciclo_zen/bloc/WebState.dart';
import 'package:riciclo_zen/models/CityModel.dart';
import '../models/ItemModel.dart';
import 'dart:developer';

class WebCubit extends Cubit<WebState> {

  WebCubit() : super(WebState(""));

  void setLink(String url) {
    emit(WebState(url));
  }


}