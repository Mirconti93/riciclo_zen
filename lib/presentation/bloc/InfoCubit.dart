// Definizione del Cubit

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';
import 'package:riciclo_zen/domain/repository/InfosRepository.dart';

import '../../commons/Constants.dart';
import '../../commons/DataResponse.dart';
import 'InfoState.dart';

class InfoCubit extends Cubit<InfoState> {

  final GetIt locator = GetIt.instance;
  List<InfoModel> _infosList = [];

  InfoCubit() : super(const InfoState([]));

  void getInfos() async {
    emit(LoadingState());
    InfosRepository _infosRepository =  locator<InfosRepository>();
    _infosRepository.fetchData().listen((data) {
          InfoState cityState = ErrorState(Constants.ERROR_DATA_FETCH);
          if (data is DataResponse<List<InfoModel>>) {
            if (data.isSuccess()) {
              _infosList = data.data as List<InfoModel>;
              cityState = InfoState(_infosList);
            } else {
              if (data.error != null) {
                cityState = ErrorState(data.error.toString());
              }
            }
          }
          emit(cityState);
        }
    );

  }

  void filterList(String text) {
    emit(InfoState(_infosList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }


}