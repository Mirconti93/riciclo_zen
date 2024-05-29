import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        height: 50,
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
