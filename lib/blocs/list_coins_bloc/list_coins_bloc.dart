import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCoinsBloc extends Bloc<ListCoinsEvent, ListCoinsState> {
  ListCoinsBloc() : super(ListCoinsEmpty());

  @override
  Stream<ListCoinsState> mapEventToState(ListCoinsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchListCoins) {
      yield ListCoinsLoading();
      try {
        var coins = await getCoinsFromAPI(currency: 'usd',start: 1,limit: 20,sparkline: false);
        yield ListCoinsLoaded(coins);
      } catch (e) {
        yield ListCoinsLoadFail(e.toString());
      }
    }
  }
}
