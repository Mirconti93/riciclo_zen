import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riciclo_zen/models/ItemModel.dart';

class GenericCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String comment;
  final bool showComment;

  const GenericCard({ super.key, required this.title, required this.subtitle, required this.showComment, this.comment = ""});

  @override
  Widget build(BuildContext context) {
    return Card(color: const Color(0xFF152218),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.title,
                style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Text(this.subtitle,
              style: TextStyle(
                  color: Colors.amber[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              ),
            Visibility(
              visible: showComment,
              child: Text(this.comment)
            )
          ]
        ),
      ),
    );
  }
}