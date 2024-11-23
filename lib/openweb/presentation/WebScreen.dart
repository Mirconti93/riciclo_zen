import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WebWidget.dart';
import 'bloc/WebCubit.dart';
import 'bloc/WebState.dart';

class WebScreen extends StatelessWidget {
  final String url;

  const WebScreen({Key? key, required this.url});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WebCubit, WebState>(builder: (context, state) {
          return WebWidget(url: url);
        }
    );
  }
}