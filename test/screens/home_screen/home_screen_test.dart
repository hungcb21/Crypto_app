import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/services/coin_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// class MockCoinService extends Mock implements AppCoinService {}
class MockCointEvent extends ListCoinsEvent {}

class MockCoinService extends Mock implements CoinSevice {}

void main() {
  CoinSevice albumService;
  ListCoinsBloc? albumBloc;

  setUp(() {
    albumService = MockCoinService();
    albumBloc = ListCoinsBloc();
  });

  tearDown(() {
    albumBloc?.close();
  });

  blocTest('emits [] when no event is added',
      build: () => ListCoinsBloc(), expect: () => []);

  blocTest(
    'emits [AlbumLoádsaadInProgress] then [AlbumLoadSucess] when [AlbumRequested] is called',
    build: () {
      albumService = MockCoinService();
      return ListCoinsBloc(service: albumService);
    },
    act: (ListCoinsBloc bloc) =>
        bloc.add(FetchListCoins(currency: 'usd', sparkline: true)),
    expect: () => [ListCoinsLoading(), ListCoinsLoaded(hasReachedEnd: false)],
  );

  blocTest(
    'emits [AlbumLoadInProgress] then [AlbumLoadSucess] when [AlbumRequested] is called',
    build: () {
      albumService = MockCoinService();
      when(albumService.getCoinsFromAPI(
              currency: '', start: 1, limit: 2, sparkline: true))
          .thenThrow(Exception());
      return ListCoinsBloc(service: albumService);
    },
    act: (ListCoinsBloc bloc) =>
        bloc.add(FetchListCoins(currency: '', sparkline: true)),
    expect: () => [ListCoinsLoading(), ListCoinsLoadFail()],
  );
}
