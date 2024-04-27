// Widget per visualizzare e aggiungere elementi alla lista
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( child: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].name),
                  subtitle: Text(state.items[index].material),
                );
              },
            ),
          ),
        ],
      );
    }
    ));
  }
}