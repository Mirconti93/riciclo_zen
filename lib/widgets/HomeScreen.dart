import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/bloc/ItemsState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Riciclo Zen"),
        ),
        body: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {

          return Column(
            children: <Widget>[
              const Text("Scegli il numero di squadre:"),
              ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal),
              ),
                onPressed: () {

                  Navigator.of(context).pushNamed('/draw');
                },
                child: const Text("Avanti"),)
            ],
          );
        })
    );
  }
}