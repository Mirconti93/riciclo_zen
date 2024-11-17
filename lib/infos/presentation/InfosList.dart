import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/presentation/widgets/CustomLoading.dart';
import '../../commons/presentation/widgets/ScreenWidget.dart';
import '../../openweb/presentation/WebScreen.dart';
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
                          Navigator.pushNamed(
                              context, WebScreen.routeName,
                              arguments: WebArguments(
                                  state.infos[index].link
                              )
                          )
                        },
                        child: GenericCard(
                          title: state.infos[index].name,
                          subtitle: "",
                          comment: state.infos[index].description,
                          commentColor: Theme.of(context).colorScheme.primary,
                          showSubtitle: true,
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
