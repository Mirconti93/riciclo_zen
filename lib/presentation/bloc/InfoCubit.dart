// Definizione del Cubit

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/domain/models/InfoModel.dart';

import 'InfoState.dart';

class InfoCubit extends Cubit<InfoState> {

  InfoCubit() : super(const InfoState([]));

  void fetchData() async {
    var f = await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Info');
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;
      List<InfoModel> infos = [];
      values.forEach((key, value) {
        infos.add(InfoModel(name: key, link: value));
      });
      emit(InfoState(infos));
    });

  }


}