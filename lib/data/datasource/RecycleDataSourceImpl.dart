import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../domain/datasource/RecycleDataSource.dart';
import '../../domain/models/ItemModel.dart';

class RecycleDataSourceImpl extends RecycleDataSource{

  @override
  Future<List<ItemModel>?> fetchData() async {
    List<ItemModel> items = [];
    await Firebase.initializeApp();
    DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Oggetti');
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value  as Map<dynamic, dynamic>;

      if (values.isEmpty) {
        //notifyError("Nessun elemento trovato");
      } else {
        log('db riciclo lenght: ${values.length}');

        values.forEach((key, value) {
          log('db value: $value');
          items.add(ItemModel.fromJson(key, value));
        });
      }

    });
    return items;

  }

}
