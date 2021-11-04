import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/constaints/colors.dart';
import 'package:crypto_test/widgets/coin_cart.dart';
import 'package:cryptocoins_icons/cryptocoins_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<ListCoinsBloc>().add(FetchListCoins());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<ListCoinsBloc, ListCoinsState>(
          builder: (BuildContext context, state) {
            if (state is ListCoinsLoaded) {
              return ListView.builder(

                itemCount: state.listCoins.length,
                itemBuilder: (BuildContext context, int index) {
                  return CoinCart(
                    image: state.listCoins[index].image,
                    name: state.listCoins[index].name,
                    symbol: state.listCoins[index].symbol,
                    price: state.listCoins[index].current_price,
                    price_change:
                        state.listCoins[index].price_change_24h,
                  );
                },
              );
            } else if (state is ListCoinsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(child: Text('Other statessad as..'));
          },
        ),
      ),
    );
  }
}
