import 'package:flutter/widgets.dart';

abstract class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  resetState(BuildContext context);
}