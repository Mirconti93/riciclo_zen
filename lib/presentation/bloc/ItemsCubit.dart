// Definizione del Cubit

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/DataResponse.dart';
import 'package:riciclo_zen/data/repository/ItemsRepositoryImpl.dart';
import 'package:riciclo_zen/domain/repository/ItemsRepository.dart';
import 'package:riciclo_zen/presentation/widgets/ItemsList.dart';

import '../../domain/models/ItemModel.dart';
import 'ItemsState.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final GetIt locator = GetIt.instance;

  List<ItemModel> _itemList = [];

  ItemsCubit() : super(ItemsState(const []));

  void getItems() async {
    emit(LoadingState());
    ItemsRepository _itemsRepository =  locator<ItemsRepository>();
    _itemsRepository.fetchData().listen(
        (data) {
          log("On data success");
          ItemsState itemsState = ErrorState(Constants.ERROR_DATA_FETCH);
          if (data is DataResponse<List<ItemModel>>) {
            if (data.isSuccess()) {
              _itemList = data.data as List<ItemModel>;
              itemsState = ItemsState(_itemList);
            } else {
              if (data.error != null) {
                itemsState = ErrorState(data.error.toString());
              }
            }
          }
          emit(itemsState);
      }
    );
  }

  void filterList(String text) {
    emit(ItemsState(_itemList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }


}