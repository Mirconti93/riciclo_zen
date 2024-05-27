import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/CityCubit.dart';
import 'package:riciclo_zen/bloc/CityState.dart';
import 'package:riciclo_zen/widgets/GenericCard.dart';
import 'package:riciclo_zen/widgets/WebScreen.dart';

import 'SearchWidet.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CityCubit, CityState>(builder: (context, state) {
      return Column(
        children: [
          const Text("Cerca la città per leggere le informazioni:"),
          SearchWidget(callback: (String value) {
            context.read<CityCubit>().filterData(value);
          }),
          Expanded(
              child: ListView.builder(
                itemCount: state.cityList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, WebScreen.routeName)},
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
    });

  }
  
  
}