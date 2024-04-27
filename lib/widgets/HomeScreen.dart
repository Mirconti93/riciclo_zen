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
        body: Column(
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
        ),
    );
  }
}