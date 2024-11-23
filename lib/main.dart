import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riciclo_zen/commons/di/injection.dart';
import 'package:riciclo_zen/city/presentation/bloc/CityCubit.dart';
import 'package:riciclo_zen/infos/presentation/bloc/InfoCubit.dart';
import 'package:riciclo_zen/items/presentation/bloc/ItemsCubit.dart';

import 'commons/navigation/Router.dart';
import 'commons/presentation/screens/MainScreen.dart';
import 'commons/theme/GlobalThemeData.dart';
import 'openweb/presentation/WebScreen.dart';
import 'openweb/presentation/bloc/WebCubit.dart';

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
          child: MaterialApp.router (
              title: 'Riciclo Zen',
              themeMode: ThemeMode.dark,
              theme: GlobalThemeData.lightThemeData,
              darkTheme: GlobalThemeData.darkThemeData,
              routerConfig: goRouter,
          )
      );
  }
}