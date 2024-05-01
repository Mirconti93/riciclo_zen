import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/CityCubit.dart';
import 'package:riciclo_zen/bloc/CityState.dart';
import 'package:riciclo_zen/widgets/GenericCard.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded( child:
        BlocBuilder<CityCubit, CityState>(builder: (context, state) {
          return ListView.builder(
            itemCount: state.cityList.length,
            itemBuilder: (context, index) {
              return GenericCard(
                title: state.cityList[index].name,
                subtitle: state.cityList[index].link,
                showComment: false,
              );
            },
          );
        }
        )
        ),
      ],
    );

  }
  
  
}