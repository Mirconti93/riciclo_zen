import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/commons/Constants.dart';

import '../../commons/presentation/widgets/ScreenWidget.dart';
import '../../commons/presentation/widgets/CustomLoading.dart';
import '../../commons/presentation/widgets/GenericCard.dart';
import '../../commons/presentation/widgets/SearchWidet.dart';
import '../../commons/presentation/widgets/TopText.dart';
import 'bloc/ItemsCubit.dart';
import 'bloc/ItemsState.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
      child: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
        switch (state.runtimeType) {
          case const (ListState):
            return Column(
              children: [
                const TopText(text: "Cerca l'oggetto per sapere dove gettarlo:"),
                SearchWidget(callback: (String value) {
                  context.read<ItemsCubit>().filterList(value);
                }),
                Expanded(
                    child: ListView.builder(
                      itemCount: (state as ListState).items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector (
                          onTap: () => {
                            _showPopup(state.items[index].name, state.items[index].material, state.items[index].comment, context)
                          },
                          child: GenericCard(
                            title: state.items[index].name,
                            subtitle: state.items[index].material,
                            comment: state.items[index].comment,
                            showSubtitle: true,
                            titleColor: Theme.of(context).colorScheme.secondary,
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
            String message = (state is ErrorState) ? (state as ErrorState).message : Constants.GENERIC_ERROR;
            return Text(message);
        }
      }));
  }

  void _showPopup(String title, String material, String description, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          title: Text(title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)
          ),
          content: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(material,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
              ),
              Text(description,
                  style: const TextStyle(
                      fontSize: 20)
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Chiudi il popup
              },
              child: const Text('Chiudi'),
            ),
          ],
        );
      },
    );
  }

}

