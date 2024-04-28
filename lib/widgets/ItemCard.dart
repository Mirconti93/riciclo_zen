import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riciclo_zen/models/ItemModel.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;

  const ItemCard({ super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  Widget build(BuildContext context) {
    return Card(color: const Color(0xFFFFE306),
      child: Container(
        child: Text(""),
      ),
    );
  }
}