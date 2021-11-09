import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_event.dart';
import 'package:crypto_test/blocs/list_coins_bloc/list_coins_state.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:crypto_test/screens/home_screen/home_screen.dart';
import 'package:crypto_test/services/coin_service.dart';
import 'package:crypto_test/widgets/coin_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock_data/coins_mock_data.dart';

class MockAlbumBloc extends MockBloc<ListCoinsEvent, ListCoinsState>
    implements ListCoinsBloc {}

class MockCoinService extends Mock implements CoinService {}

class FakeCoinState extends Fake implements ListCoinsState {}

class FakeCoinEvent extends Fake implements ListCoinsEvent {}

main() {
  final mockResponse = json.decode(mockCoinsData);

  setUpAll(() {
    registerFallbackValue(FakeCoinState());
    registerFallbackValue(FakeCoinEvent());
  });

  group('Home Screen Tests', () {
    late CoinService coinService;
    late ListCoinsBloc coinsBloc;
    var widget = MaterialApp(
      home: BlocProvider(create: (context) => coinsBloc, child: HomeScreen()),
    );

    setUp(() {
      coinService = MockCoinService();
      coinsBloc = MockAlbumBloc();
    });

    tearDown(() {
      coinsBloc.close();
    });

    testWidgets(
        'Should render progress indicator when coin bloc state is [ListCoinsLoading]',
        (tester) async {
      when(() => coinsBloc.state).thenReturn(ListCoinsLoading());
      await tester.pumpWidget(widget);
      await tester.pump();

      final indicatorFinder = find.byType(CircularProgressIndicator);
      expect(indicatorFinder, findsOneWidget);
    });

    testWidgets(
        'Should render red text with error message when coin bloc state is [ListCoinsLoadFail]',
        (tester) async {
      final errorMessage = 'Exception: Failed to load coins list';
      when(() => coinsBloc.state).thenReturn(ListCoinsLoadFail(error: errorMessage));
      await tester.pumpWidget(widget);
      await tester.pump();

      final errorMessageFinder = find.text(errorMessage);
      expect(errorMessageFinder, findsOneWidget);
    });

    testWidgets(
        'Should render CoinCart list when bloc state is [ListCoinsLoaded]',
        (tester) async {
      when(() => coinsBloc.state).thenReturn(ListCoinsLoaded(
          listCoins: List<Coins>.from(
              mockResponse.map((model) => Coins.fromJson(model))).toList(),
          hasReachedEnd: true));
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final coinCardFinder = find.descendant(
          of: find.byType(ListView), matching: find.byType(CoinCart));
      expect(coinCardFinder, findsNWidgets(2));
    });
  });
}
