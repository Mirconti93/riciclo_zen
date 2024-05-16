import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riciclo_zen/models/ItemModel.dart';

class GenericCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String comment;
  final bool showSubtitle;

  const GenericCard({ super.key, required this.title, this.subtitle = "", required this.showSubtitle, this.comment = ""});

  @override
  Widget build(BuildContext context) {
    return Card(color: const Color(0xFFFF104657),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Visibility(
                visible: showSubtitle,
                child: Text(subtitle, textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xFF00E791),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
            ),
            Text(comment)
          ]
        ),
      ),
    );
  }
}