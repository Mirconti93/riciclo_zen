import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/widgets/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (BuildContext context) => ItemsCubit(),
          child: MaterialApp(
              title: 'Recylce Zen',
              theme: ThemeData(

                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
                useMaterial3: true,
              ),
              routes: {
                //'/': (context) => HomePage(),
                '/detail': (context) => HomeScreen(),
              },
              home: HomeScreen()
          )
      );
  }
}