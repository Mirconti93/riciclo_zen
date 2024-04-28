import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/widgets/HomeScreen.dart';

void main() {
  Firebase.initializeApp();
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
              title: 'Riciclo Zen',
              theme: ThemeData(
                // Imposta i colori primari e secondari
                primarySwatch: Colors.indigo,
                // Imposta lo stile del testo per il corpo del testo
                textTheme: const TextTheme(
                  titleLarge: TextStyle(color: Colors.black87),
                ),
                // Imposta lo stile della barra dell'app
                appBarTheme: const AppBarTheme(
                  color: Colors.indigo,
                ),
                useMaterial3: true,
              ),
              routes: {
                '/detail': (context) => const HomeScreen(),
              },
              home: const HomeScreen()
          )
      );
  }
}