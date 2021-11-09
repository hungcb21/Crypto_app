import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/services/coin_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockCoinService extends Mock implements CoinService {}

void main() {
  CoinService coinsService;
  ListCoinsBloc? coinsBloc;

  setUp(() {
    coinsService = MockCoinService();
    coinsBloc = ListCoinsBloc();
  });

  tearDown(() {
    coinsBloc?.close();
  });

  blocTest('emits [] when no event is added',
      build: () => ListCoinsBloc(), expect: () => []);

  blocTest(
    'emits [ListCoinLoading] then [ListCoinsLoadFail] when [FetchListCoins] is called',
    build: () {
      coinsService = MockCoinService();
      return ListCoinsBloc(service: coinsService);
    },
    act: (ListCoinsBloc bloc) =>
        bloc.add(FetchListCoins(currency: 'usd', sparkline: true)),
    expect: () => [ListCoinsLoading(), ListCoinsLoaded(hasReachedEnd: false)],
  );

  blocTest(
    'emits [ListCoinLoading] then [ListCoinLoaded] when [FetchListCoins] is called',
    build: () {
      coinsService = MockCoinService();
      return ListCoinsBloc(service: coinsService);
    },
    act: (ListCoinsBloc bloc) =>
        bloc.add(FetchListCoins(currency: null,sparkline: null)),
    expect: () => [ListCoinsLoading(), ListCoinsLoadFail()],
  );

  blocTest(
    'emits [ListCoinsLoadFail] when [FetchListCoins] is called and service throws error.',
    build: () {
      coinsService = MockCoinService();
      when(coinsService.getCoinsFromAPI(
              currency: '', start: 1, limit: 2, sparkline: true))
          .thenThrow(Exception());
      return ListCoinsBloc(service: coinsService);
    },
    act: (ListCoinsBloc bloc) => bloc.add(FetchListCoins()),
    expect: () =>
        [ListCoinsLoading(), ListCoinsLoadFail(error: Exception().toString())],
  );
}
