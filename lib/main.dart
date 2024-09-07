import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/injection.dart';
import 'package:riciclo_zen/presentation/bloc/CityCubit.dart';
import 'package:riciclo_zen/presentation/bloc/InfoCubit.dart';
import 'package:riciclo_zen/presentation/bloc/ItemsCubit.dart';
import 'package:riciclo_zen/presentation/bloc/WebCubit.dart';
import 'package:riciclo_zen/presentation/screens/HomeScreen.dart';
import 'package:riciclo_zen/presentation/screens/WebScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
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
            BlocProvider(create: (BuildContext context) => ItemsCubit()..getItems()),
            BlocProvider(create: (BuildContext context) => CityCubit()..getCities()),
            BlocProvider(create: (BuildContext context) => InfoCubit()..getInfos()),
            BlocProvider(create: (BuildContext context) => WebCubit())
          ],
          child: MaterialApp(
              title: 'Riciclo Zen',
              theme: ThemeData(
                // Imposta i colori primari e secondari
                primarySwatch: Colors.teal,
                brightness: Brightness.dark,   // Determines if the theme is light or dark
                primaryColor: const Color(0xFF009384),//Colors.teal,      // Primary color for major parts of the app (toolbars, tab bars, etc.)
                primaryColorDark: const Color(0xFF2F3136), // Darker variant of the primary color
                primaryColorLight: Colors.blue[100], // Lighter variant of the primary color
                canvasColor: const Color(0xFF2F3136),   // Background color for larger parts of the app
                scaffoldBackgroundColor: const Color(0xFF202225), // Background color for Scaffolds
                cardColor: const Color(0xFF009384),//Colors.grey[700],        // Background color of cards
                dividerColor: Colors.grey,
                highlightColor: Colors.amber[700], // Color of ink splash when tapped
                splashColor: Color(0xFF00E775),    // Color of ink splash during a ripple effect
                unselectedWidgetColor: Colors.grey[400], // Color for widgets like unchecked checkboxes, radio buttons, etc.
                disabledColor: Colors.grey[200], // Color to indicate disabled widgets
                secondaryHeaderColor: Colors.blue[50], // Background color for sticky headers
                textTheme: const TextTheme(
                  titleLarge: TextStyle(color: Colors.black87),
                ),
                // Imposta lo stile della barra dell'app
                appBarTheme: const AppBarTheme(
                  color: Color(0xFF006C76),
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