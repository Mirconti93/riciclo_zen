import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/widgets/ItemsList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("Riciclo Zen"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              const Text("Scegli il numero di squadre:"),
              const Expanded(child: ItemsList()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  final cubit = BlocProvider.of<ItemsCubit>(context);
                  cubit.fetchData();
                  //Navigator.of(context).pushNamed('/draw');
                },
                child: const Text("Avanti",style: TextStyle(
                    color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal),
                ),
              )
            ],
          )
      ),
    );
  }
}