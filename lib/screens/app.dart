import '../blocs/list_coins_bloc/list_coins_bloc.dart';
import '../blocs/list_coins_bloc/list_coins_event.dart';
import 'home_screen/home_screen.dart';
import '../services/app_coin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
            create: (context) =>
                ListCoinsBloc(service: AppCoinService(httpClient))
                  ..add(FetchListCoins(currency: 'usd', sparkline: true)),
            child: HomeScreen()),
      ),
    );
  }
}
