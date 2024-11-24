// Definizione del Cubit

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/infos/domain/InfosRepository.dart';

import '../../../commons/Constants.dart';
import '../../../commons/domain/DataResponse.dart';
import '../../domain/models/InfoModel.dart';
import 'InfoState.dart';

class InfoCubit extends Cubit<InfoState> {

  final GetIt locator = GetIt.instance;
  List<InfoModel> _infosList = [];

  InfoCubit() : super(ListState(const []));

  void getInfos() async {
    emit(LoadingState());
    locator<InfosRepository>().fetchData().listen((data) {
          InfoState cityState = ErrorState(Constants.ERROR_DATA_FETCH);
          if (data.isSuccess()) {
            _infosList = data.data as List<InfoModel>;
            cityState = ListState(_infosList);
          } else {
            if (data.error != null) {
              cityState = ErrorState(data.error.toString());
            }
          }
          emit(cityState);
        }
    );

  }

  void filterList(String text) {
    emit(ListState(_infosList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }

}