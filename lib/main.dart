import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/bloc/InfoCubit.dart';
import 'package:riciclo_zen/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/bloc/WebCubit.dart';
import 'package:riciclo_zen/commons/Constants.dart';
import 'package:riciclo_zen/widgets/CItyList.dart';
import 'package:riciclo_zen/widgets/HomeScreen.dart';
import 'package:riciclo_zen/widgets/WebScreen.dart';

import 'bloc/CityCubit.dart';

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
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => ItemsCubit()..fetchData()),
            BlocProvider(create: (BuildContext context) => CityCubit()..fetchData()),
            BlocProvider(create: (BuildContext context) => InfoCubit()..fetchData()),
            BlocProvider(create: (BuildContext context) => WebCubit())
          ],
          child: MaterialApp(
              title: 'Riciclo Zen',
              theme: ThemeData(
                // Imposta i colori primari e secondari
                primarySwatch: Colors.teal,
                brightness: Brightness.dark,   // Determines if the theme is light or dark
                primaryColor: Colors.teal,      // Primary color for major parts of the app (toolbars, tab bars, etc.)
                primaryColorDark: const Color(0x104657), // Darker variant of the primary color
                primaryColorLight: Colors.blue[100], // Lighter variant of the primary color
                canvasColor: const Color(0xFF104657),   // Background color for larger parts of the app
                scaffoldBackgroundColor: const Color(0xFF25252F), // Background color for Scaffolds
                cardColor: Colors.grey[700],        // Background color of cards
                dividerColor: Colors.grey,
                highlightColor: Colors.amber[700], // Color of ink splash when tapped
                splashColor: Colors.amber[200],    // Color of ink splash during a ripple effect
                unselectedWidgetColor: Colors.grey[400], // Color for widgets like unchecked checkboxes, radio buttons, etc.
                disabledColor: Colors.grey[200], // Color to indicate disabled widgets
                secondaryHeaderColor: Colors.blue[50], // Background color for sticky headers
                backgroundColor: Colors.grey[50],  // Default background color
                errorColor: Colors.red,         // Default color for error messages and icons
                toggleableActiveColor: Colors.blue[600],
                textTheme: const TextTheme(
                  titleLarge: TextStyle(color: Colors.black87),
                ),
                // Imposta lo stile della barra dell'app
                appBarTheme: const AppBarTheme(
                  color: Color(0xFF004444),
                ),
                useMaterial3: true,
              ),
              home: const HomeScreen(),
            routes: {
              WebScreen.routeName: (context) => const WebScreen(),
            },
          )
      );
  }
}