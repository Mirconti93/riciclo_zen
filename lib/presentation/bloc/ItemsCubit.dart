// Definizione del Cubit

import 'dart:convert';

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/DataResponse.dart';
import 'package:riciclo_zen/data/datasource/RecycleDataSourceImpl.dart';
import 'package:riciclo_zen/data/repository/ItemsRepositoryImpl.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';
import 'package:riciclo_zen/presentation/widgets/ItemsList.dart';
import '../../domain/models/ItemModel.dart';
import 'ItemsState.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final GetIt locator = GetIt.instance;

  ItemsCubit() : super(ItemsState(const []));


  void getItems(String? text) async {
    emit(LoadingState());
    ItemsRepository _itemsRepository =  locator<ItemsRepository>();
    _itemsRepository.fetchData().then(
        (data) => {
        if (data != null && data is DataResponse<List<ItemModel>>) {
          if (data.isSuccess()) {
            if (text != null && !text.isEmpty) {
              emit(ItemsState((data.data as List<ItemModel>).where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()))
            } else {
              emit(ItemsState(data.data as List<ItemModel>))
            }
          } else {
            emit(ErrorState(Constants.ERROR_DATA_FETCH))
          }
        }
      }
    ).catchError(() =>
        emit(ErrorState(Constants.ERROR_DATA_FETCH))
    );
  }


}