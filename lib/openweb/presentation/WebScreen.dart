import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WebWidget.dart';
import 'bloc/WebCubit.dart';
import 'bloc/WebState.dart';

class WebScreen extends StatelessWidget {
  static const String routeName = "/web";

  const WebScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as WebArguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("Riciclo Zen"),
        ),
        body: BlocBuilder<WebCubit, WebState>(builder: (context, state) {
          return WebWidget(url: args.url);
        }
      )
    );
  }
}

class WebArguments {
  final String url;

  WebArguments(this.url);
}