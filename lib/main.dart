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
import 'package:riciclo_zen/theme/GlobalThemeData.dart';

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
              themeMode: ThemeMode.dark,
              theme: GlobalThemData.lightThemeData,
              darkTheme: GlobalThemData.darkThemeData,
              home: const HomeScreen(),
            routes: {
              WebScreen.routeName: (context) => const WebScreen(),
            },
          )
      );
  }
}