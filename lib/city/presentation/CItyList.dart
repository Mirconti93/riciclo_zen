import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:riciclo_zen/commons/navigation/Router.dart';

import '../../commons/Constants.dart';
import '../../commons/presentation/widgets/ScreenWidget.dart';
import '../../commons/presentation/widgets/TopText.dart';
import '../../openweb/presentation/WebScreen.dart';
import '../../commons/presentation/widgets/CustomLoading.dart';
import '../../commons/presentation/widgets/GenericCard.dart';
import '../../commons/presentation/widgets/SearchWidet.dart';
import '../../openweb/presentation/bloc/WebCubit.dart';
import 'bloc/CityCubit.dart';
import 'bloc/CityState.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  void _onTap(BuildContext context, String url) {
    context.read<WebCubit>().setLink(url);
    context.go("$ROUTE_CITY$ROUTE_WEB");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
      child: BlocBuilder<CityCubit, CityState>(builder: (context, state) {
        switch (state.runtimeType) {
          case const (ListState):
            return Column(
              children: [
                const TopText(text: "Cerca la città per leggere le informazioni:"),
                SearchWidget(callback: (String value) {
                  context.read<CityCubit>().filterList(value);
                }),
                Expanded(
                    child: ListView.builder(
                      itemCount: (state as ListState).cityList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              _onTap(context, state.cityList[index].link),
                          child: GenericCard(
                            title: state.cityList[index].name,
                            comment: state.cityList[index].link,
                            commentColor: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                            showSubtitle: false,
                          ),
                        );
                      },
                    )
                )
              ],
            );
          case const (LoadingState):
            return const CustomLoading();
          default:
            String message = (state is ErrorState) ? (state as ErrorState).message : Constants.GENERIC_ERROR;
            return Text(message);
        }
      }));
  }

}