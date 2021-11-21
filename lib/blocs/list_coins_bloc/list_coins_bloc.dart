import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/coin_service.dart';
import 'list_coins_event.dart';
import 'list_coins_state.dart';

class ListCoinsBloc extends Bloc<ListCoinsEvent, ListCoinsState> {
  CoinService service;
  final NUMBER_OF_COINS_PER_STATE = 100;
  ListCoinsBloc({required this.service}) : super(ListCoinsEmpty()) {
    on<FetchListCoins>((event, emit) async {
      try {
        emit(ListCoinsLoading());
        final coins = await service.getCoinsFromAPI(
            currency: event.currency!,
            start: 1,
            limit: NUMBER_OF_COINS_PER_STATE,
            sparkline: event.sparkline!);
        emit(ListCoinsLoaded(listCoins: coins));
      } catch (e) {
        emit(ListCoinsLoadFail(error: e.toString()));
      }
    });
  }
}
