import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/CityCubit.dart';
import '../bloc/CityState.dart';
import '../screens/WebScreen.dart';
import 'CustomLoading.dart';
import 'GenericCard.dart';
import 'SearchWidet.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(builder: (context, state) {
      switch (state.runtimeType) {
        case ErrorState:
          return Text((state as ErrorState).message);
        case LoadingState:
          return const CustomLoading();
        default:
          return Column(
            children: [
              const Text("Cerca la città per leggere le informazioni:"),
              SearchWidget(callback: (String value) {
                context.read<CityCubit>().filterList(value);
              }),
              Expanded(
                  child: ListView.builder(
                    itemCount: state.cityList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(
                              context, WebScreen.routeName,
                              arguments: WebArguments(
                                  state.cityList[index].link
                              )
                          )
                        },
                        child: GenericCard(
                          title: state.cityList[index].name,
                          comment: state.cityList[index].link,
                          showSubtitle: false,
                        ),
                      );
                    },
                  )
              )
            ],
          );
      }
    });

  }

}