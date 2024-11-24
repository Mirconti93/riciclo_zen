// Definizione del Cubit

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../domain/models/ItemModel.dart';
import 'dart:developer';

import 'WebState.dart';

class WebCubit extends Cubit<WebState> {
  String _url = "";

  WebCubit() : super(LoadingState());

  void setLink(String url) {
    _url = url;
    emit(BrowserState(_url));
  }

  String getLink() {
    return _url;
  }

}