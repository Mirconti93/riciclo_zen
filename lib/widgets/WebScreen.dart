import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/bloc/WebCubit.dart';
import 'package:riciclo_zen/bloc/WebState.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/commons/NavigationItem.dart';
import 'package:riciclo_zen/widgets/CItyList.dart';
import 'package:riciclo_zen/widgets/ItemsList.dart';
import 'package:riciclo_zen/widgets/WebWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  static const String routeName = "/web";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("Riciclo Zen"),
        ),
        body: BlocBuilder<WebCubit, WebState>(builder: (context, state) {
          return WebWidget(url: state.url);
        }
      )
    );
  }
}