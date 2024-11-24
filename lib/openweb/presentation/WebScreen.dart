import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/Constants.dart';
import '../../commons/presentation/widgets/CustomLoading.dart';
import 'WebWidget.dart';
import 'bloc/WebCubit.dart';
import 'bloc/WebState.dart';

class WebScreen extends StatelessWidget {

  const WebScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WebCubit, WebState>(builder: (context, state) {
      switch (state.runtimeType) {
        case BrowserState():
          return WebWidget(url: (context.read<WebCubit>().state as BrowserState).url);
        case const (LoadingState):
          return const CustomLoading();
        default:
          String message = (state is ErrorState) ? (state as ErrorState).message : Constants.GENERIC_ERROR;
          return Text(message);
        }
    });
  }
}