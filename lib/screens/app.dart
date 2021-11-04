import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => ListCoinsBloc()..add(FetchListCoins()),
          child: HomeScreen()),
    );
  }
}
