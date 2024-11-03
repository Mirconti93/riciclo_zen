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

  CityCubit() : super(const CityState([]));

  void getCities() async {
    emit(LoadingState());
    CityRepository _cityRepository =  locator<CityRepository>();
    _cityRepository.fetchData().listen(
        (data) {
          CityState cityState = ErrorState(Constants.ERROR_DATA_FETCH);
          if (data is DataResponse<List<CityModel>>) {
            if (data.isSuccess()) {
              _citiesList = data.data as List<CityModel>;
              cityState = CityState(_citiesList);
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
    emit(CityState(_citiesList.where((element) => element.name.toLowerCase().contains(text.toLowerCase())).toList()));
  }

  void resetState() {
    if (_citiesList != null && !_citiesList.isEmpty) emit(CityState(_citiesList));
  }

}