// Widget per visualizzare e aggiungere elementi alla lista
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';
import 'package:riciclo_zen/widgets/GenericCard.dart';
import 'package:riciclo_zen/widgets/SearchWidet.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
      return Column(
        children: [
          Text("Cerca l'oggetto per vedere dove buttarlo:"),
          const SearchWidget(),
          Expanded(
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return GenericCard(
                    title: state.items[index].name,
                    subtitle: state.items[index].material,
                    comment: state.items[index].comment,
                    showComment: true,
                  );
                },
              )
          )
        ],
      );
    });
  }
}