import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:riciclo_zen/commons/navigation/Router.dart';
import '../../commons/presentation/widgets/CustomLoading.dart';
import '../../commons/presentation/widgets/ScreenWidget.dart';

import '../../commons/presentation/widgets/GenericCard.dart';
import '../../commons/presentation/widgets/SearchWidet.dart';
import 'bloc/InfoCubit.dart';
import 'bloc/InfoState.dart';

class InfosList extends ScreenWidget {
  const InfosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoCubit, InfoState>(builder: (context, state) {
      switch (state.runtimeType) {
        case ErrorState:
          return Text((state as ErrorState).message);
        case LoadingState:
          return const CustomLoading();
        default:
          return Column(
            children: [
              const Text("Info utili:"),
              SearchWidget(callback: (String value) {
                context.read<InfoCubit>().filterList(value);
              }),
              Expanded(
                  child: ListView.builder(
                    itemCount: state.infos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          context.go("$ROUTE_INFOS$ROUTE_WEB/${state.cityList[index].link}")
                        },
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
      }
    });
  }

  @override
  resetState(BuildContext context) {
    context.read<InfoCubit>().resetState();
  }

}
