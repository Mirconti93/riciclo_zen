import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:riciclo_zen/city/domain/CityRepository.dart';

import '../../../commons/Constants.dart';
import '../../../commons/domain/DataResponse.dart';
import '../../domain/models/CityModel.dart';
import 'CityState.dart';

class CityCubit extends Cubit<CityState> {
  final GetIt locator = GetIt.instance;
  List<CityModel> _citiesList = [];

  CityCubit() : super(ListState(const []));

  void getCities() async {
    emit(LoadingState());
    locator<CityRepository>().fetchData().listen(
        (data) {
          CityState cityState = ErrorState(Constants.ERROR_DATA_FETCH);
          if (data.isSuccess()) {
            _citiesList = data.data as List<CityModel>;
            cityState = ListState(_citiesList);
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
    emit(ListState(_citiesList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }

}