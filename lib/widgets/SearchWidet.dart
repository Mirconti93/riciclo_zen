import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/NavigationItem.dart';
import 'package:riciclo_zen/widgets/CItyList.dart';
import 'package:riciclo_zen/widgets/ItemsList.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  static const String routeName = "/web";

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {


  @override
  Widget build(BuildContext context) {

    return TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<ItemsCubit>().filterData(value);
        }
    );
  }
}