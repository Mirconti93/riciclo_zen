import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riciclo_zen/domain/models/ItemModel.dart';

class CustomLoading extends StatelessWidget {

  const CustomLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
          child: const CircularProgressIndicator(color: Colors.white,)
    );
  }
}