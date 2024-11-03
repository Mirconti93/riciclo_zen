import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String comment;
  final bool showSubtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? commentColor;

  const GenericCard({ super.key,
    required this.title,
    this.subtitle = "",
    required this.showSubtitle,
    this.comment = "",
    this.titleColor,
    this.subtitleColor,
    this.commentColor
  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, textAlign: TextAlign.start,
                style: TextStyle(
                    color: titleColor != null ? titleColor : Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Visibility(
                visible: showSubtitle,
                child: Text(subtitle, textAlign: TextAlign.center,
                  style: TextStyle(
                      color: subtitleColor != null ? subtitleColor : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
            ),
            Text(comment,
              style: TextStyle(
                color: commentColor != null ? commentColor : Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14),
            )
          ]
        ),
      ),
    );
  }
}

