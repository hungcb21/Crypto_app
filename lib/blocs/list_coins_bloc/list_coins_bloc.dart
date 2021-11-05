import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:crypto_test/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCoinsBloc extends Bloc<ListCoinsEvent, ListCoinsState> {
  ListCoinsBloc() : super(ListCoinsEmpty());
  final NUMBER_OF_COINS_PER_STATE = 20;

  @override
  Stream<ListCoinsState> mapEventToState(ListCoinsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchListCoins &&
        !(state is ListCoinsLoaded &&
            (state as ListCoinsLoaded).hasReachedEnd)) {
      try {
        if (state is ListCoinsEmpty) {
          yield ListCoinsLoading();
          ///get coins when list empty and not scroll to end
          final coins = await getCoinsFromAPI(
              currency: 'usd',
              start: 1,
              limit: NUMBER_OF_COINS_PER_STATE,
              sparkline: false);
          yield ListCoinsLoaded(coins, false);
        } else if (state is ListCoinsLoaded) {
          final currentState = state as ListCoinsLoaded;

          ///get index of item in end of list
          int finalIndexOfCurrentPage = currentState.listCoins.length;

          ///get list when scroll to end of list
          final coins = await getCoinsFromAPI(
              currency: 'usd',
              start: finalIndexOfCurrentPage,
              limit: NUMBER_OF_COINS_PER_STATE,
              sparkline: false);
          if (coins.isEmpty) {
            yield currentState.cloneWith(hasReachedEnd: true);
          } else {
            yield ListCoinsLoaded(currentState.listCoins + coins, false);
          }
        }
      } catch (e) {
        yield ListCoinsLoadFail(e.toString());
      }
    }
  }
}
