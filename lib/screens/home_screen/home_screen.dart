import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';

import '../../config/app_config.dart';
import '../../config/constants.dart';
import '../../constaints/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/list_coins_bloc/list_coins_bloc.dart';
import '../../blocs/list_coins_bloc/list_coins_state.dart';
import '../../constaints/colors.dart';
import '../../constaints/strings.dart';
import '../../constaints/text_style.dart';
import '../../widgets/coin_cart.dart';
import '../../widgets/search_bar.dart';
import '../detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(AppConfig.instance.getValue(AppConstants.SPARKLINE));
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  BlocBuilder<ListCoinsBloc, ListCoinsState>(
                      builder: (context, state) {
                    if (state is ListCoinsLoaded) {
                      return SearchBar(state.listCoins!);
                    }
                    return SearchBar([]);
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                decoration: BoxDecoration(
                  color: ColorsApp.backgroundBottomColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        StringData.listCoinsTitle,
                        style: TextStylesApp.listCoinsTitle,
                      ),
                    ),
                    Flexible(
                      child: BlocBuilder<ListCoinsBloc, ListCoinsState>(
                        builder: (BuildContext context, state) {
                          if (state is ListCoinsLoaded) {
                            final currentState = state as ListCoinsLoaded;
                            return RefreshIndicator(
                              onRefresh: () async {
                                context.read<ListCoinsBloc>().add(FetchListCoins(currency: 'usd',sparkline: true));
                              } ,
                              child: ListView.builder(
                                itemCount: state.listCoins!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: CoinCard(
                                      image:
                                          currentState.listCoins![index].image!,
                                      name: currentState.listCoins![index].name,
                                      symbol:
                                          currentState.listCoins![index].symbol,
                                      price: currentState
                                              .listCoins![index].current_price ??
                                          0,
                                      price_change: currentState.listCoins![index]
                                              .price_change_24h ??
                                          0,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteConstant.detailRoute,
                                          arguments: currentState.listCoins![index],
                                            );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          }  if (state is ListCoinsLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }  if (state is ListCoinsLoadFail) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text(
                                    state.error!,
                                    style: TextStylesApp.listCoinsError,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed:() async {
                                    context.read<ListCoinsBloc>().add(FetchListCoins(currency: 'usd',sparkline: true));
                                  } ,
                                  child: new Icon(Icons.refresh),
                                  backgroundColor: Colors.red,
                                ),
                              ],
                            );
                          }
                          return Center(child: Text(StringData.listEmpty));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
