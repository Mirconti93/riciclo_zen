import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/Constants.dart';

class GenericCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String comment;
  final bool showSubtitle;
  final Color titleColor;
  final Color subtitleColor;
  final Color commentColor;

  const GenericCard({ super.key,
    required this.title,
    this.subtitle = "",
    required this.showSubtitle,
    this.comment = "",
    this.titleColor = Colors.white70,
    this.subtitleColor = Colors.white70,
    this.commentColor = Colors.white70
  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Constants.SecondaryColor,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, textAlign: TextAlign.start,
                style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Visibility(
                visible: showSubtitle,
                child: Text(subtitle, textAlign: TextAlign.center,
                  style: TextStyle(
                      color: subtitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
            ),
            Text(comment,
              style: TextStyle(
                color: commentColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            )
          ]
        ),
      ),
    );
  }
}

