import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../domain/models/ItemModel.dart';

abstract class RecycleDataSource {

  Future<List<ItemModel>?> fetchData();

}
