import 'package:flutter/widgets.dart';

class TopText extends StatelessWidget {
  final String text;

  const TopText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Text(text)
    );
  }
 

}