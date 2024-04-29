import 'dart:ffi';

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
  bool showComment = true;

  @override
  Widget build(BuildContext context) {
    return Card(color: const Color(0xFF152218),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.name,
                style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Text(widget.item.material),
            Visibility(
              visible: showComment,
              child: Text(widget.item.comment)
            )
          ]
        ),
      ),
    );
  }
}