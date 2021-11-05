import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/constaints/colors.dart';
import 'package:crypto_test/constaints/strings.dart';
import 'package:crypto_test/constaints/text_style.dart';
import 'package:crypto_test/screens/detail_screen/detail_screen.dart';
import 'package:crypto_test/widgets/coin_cart.dart';
import 'package:crypto_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _scrollThreadHold = 500.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListCoinsBloc _bloc = BlocProvider.of(context);
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtent - currentScroll <= _scrollThreadHold) {
        _bloc.add(FetchListCoins());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      return SearchBar(state.listCoins);
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
                            return ListView.builder(
                              itemCount: state.hasReachedEnd
                                  ? state.listCoins.length
                                  : state.listCoins.length + 1,
                              controller: _scrollController,
                              itemBuilder: (BuildContext context, int index) {
                                ///if scroll to end but still wait api response, it show process indicator
                                if (index >= state.listCoins.length) {
                                  return Container(
                                    child: Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.5,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CoinCart(
                                        image:
                                            currentState.listCoins[index].image,
                                        name:
                                            currentState.listCoins[index].name,
                                        symbol: currentState
                                            .listCoins[index].symbol,
                                        price: currentState
                                            .listCoins[index].current_price,
                                        price_change: currentState
                                            .listCoins[index].price_change_24h,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          } else if (state is ListCoinsLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ListCoinsLoadFail) {
                            return Center(
                              child: Text(
                                state.error,
                                style: TextStylesApp.listCoinsError,
                              ),
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
