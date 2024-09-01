import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/presentation/widgets/CustomLoading.dart';

import '../bloc/InfoState.dart';
import '../bloc/InfoCubit.dart';
import 'GenericCard.dart';
import 'SearchWidet.dart';

class InfosList extends StatelessWidget {
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
                      return GenericCard(
                        title: state.infos[index].name,
                        subtitle: state.infos[index].link,
                        comment: "",
                        showSubtitle: true,
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
