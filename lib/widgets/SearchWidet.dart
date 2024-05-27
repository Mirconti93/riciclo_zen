import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/NavigationItem.dart';
import 'package:riciclo_zen/commons/OnSearchCallback.dart';
import 'package:riciclo_zen/widgets/CItyList.dart';
import 'package:riciclo_zen/widgets/ItemsList.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchWidget extends StatefulWidget {
  final void Function(String) callback;

  const SearchWidget({Key? key, required this.callback}) : super(key: key);

  static const String routeName = "/web";

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        height: 35,
        child: TextField(
          decoration: const InputDecoration(
            //labelText: 'Search',
            filled: true, // <- this is required.
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {widget.callback(value);}
        )
      )
    );
  }
}