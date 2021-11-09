import 'package:crypto_test/model/coins.dart';

import 'list_coins_event.dart';
import 'list_coins_state.dart';
import '../../services/coin_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCoinsBloc extends Bloc<ListCoinsEvent, ListCoinsState> {
  ListCoinsBloc({this.service}) : super(ListCoinsEmpty());
  final NUMBER_OF_COINS_PER_STATE = 100;
  CoinService? service;

  @override
  Stream<ListCoinsState> mapEventToState(ListCoinsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchListCoins) {
      try {
        yield ListCoinsLoading();
        final coins = await service!.getCoinsFromAPI(
            currency: event.currency!,
            start: 1,
            limit: NUMBER_OF_COINS_PER_STATE,
            sparkline: event.sparkline!);
        yield ListCoinsLoaded(listCoins: coins);
        } catch (e)
        {
          yield ListCoinsLoadFail(error: e.toString());
        }
      }
    }
}
