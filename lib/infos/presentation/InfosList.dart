import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:riciclo_zen/commons/navigation/Router.dart';
import '../../commons/Constants.dart';
import '../../commons/presentation/widgets/CustomLoading.dart';
import '../../commons/presentation/widgets/ScreenWidget.dart';

import '../../commons/presentation/widgets/GenericCard.dart';
import '../../commons/presentation/widgets/SearchWidet.dart';
import '../../openweb/presentation/bloc/WebCubit.dart';
import 'bloc/InfoCubit.dart';
import 'bloc/InfoState.dart';

class InfosList extends StatelessWidget {
  const InfosList({super.key});

  void _onTap(BuildContext context, String url) {
    context.read<WebCubit>().setLink(url);
    context.go("$ROUTE_INFOS$ROUTE_WEB");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoCubit, InfoState>(builder: (context, state) {
      switch (state.runtimeType) {
        case const (ListState):
          return Column(
            children: [
              const Text("Info utili:"),
              SearchWidget(callback: (String value) {
                context.read<InfoCubit>().filterList(value);
              }),
              Expanded(
                  child: ListView.builder(
                    itemCount: (state as ListState).infos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _onTap(context, state.infos[index].link),
                        child: GenericCard(
                          title: state.infos[index].name,
                          comment: state.infos[index].description,
                          commentColor: Theme.of(context).colorScheme.primary,
                          showSubtitle: false,
                        )
                      );
                    },
                  )
              )
            ],
          );
        case const (LoadingState):
          return const CustomLoading();
        default:
          String message = (state is ErrorState) ? (state).message : Constants.GENERIC_ERROR;
          return Text(message);
      }
    });
  }
}
