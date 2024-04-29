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
                brightness: Brightness.dark,   // Determines if the theme is light or dark
                primaryColor: Colors.blue,      // Primary color for major parts of the app (toolbars, tab bars, etc.)
                primaryColorDark: Colors.blue[700], // Darker variant of the primary color
                primaryColorLight: Colors.blue[100], // Lighter variant of the primary color
                canvasColor: Colors.grey[50],   // Background color for larger parts of the app
                scaffoldBackgroundColor: Color(0xFF101A11), // Background color for Scaffolds
                cardColor: Colors.grey[700],        // Background color of cards
                dividerColor: Colors.grey,
                highlightColor: Colors.amber[700], // Color of ink splash when tapped
                splashColor: Colors.amber[200],    // Color of ink splash during a ripple effect
                unselectedWidgetColor: Colors.grey[400], // Color for widgets like unchecked checkboxes, radio buttons, etc.
                disabledColor: Colors.grey[200], // Color to indicate disabled widgets
                secondaryHeaderColor: Colors.blue[50],  // Background color for sticky headers
                backgroundColor: Colors.grey[50],  // Default background color
                errorColor: Colors.red,         // Default color for error messages and icons
                toggleableActiveColor: Colors.blue[600],
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