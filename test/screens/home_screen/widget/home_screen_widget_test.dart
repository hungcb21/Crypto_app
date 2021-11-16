import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:crypto_test/screens/detail_screen/detail_screen.dart';
import 'package:crypto_test/screens/home_screen/home_screen.dart';
import 'package:crypto_test/widgets/coin_cart.dart';
import 'package:crypto_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

main() {
  final listName = 'Other  as..';
  String image = '';
  String name = 'bitcoin';
  String symbol = 'btc';
  var price = 12345;
  var price_change = 324234;
  final widgetHomeScreen = MaterialApp(
    home: HomeScreen()
  );
  //       BlocProvider(create: (context) => ListCoinsBloc(), child: HomeScreen()),
  // );

  // testWidgets('Should render name of list ', (tester) async {
  //   await tester.pumpWidget(widgetHomeScreen);
  //   expect(find.text(listName), findsOneWidget);
  // });

  testWidgets('InkWell should be tappable', (tester) async {
    bool isTapped = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: InkWell(
          onTap: () {
            isTapped = true;
          },
        ),
      ),
    ));

    final coinCardFinder = find.byType(InkWell);
    await tester.tap(coinCardFinder);
    expect(isTapped, true);
  });

  testWidgets('CoinCart should be tappable', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    bool isTapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CoinCard(
            symbol: symbol,
            price_change: price_change,
            price: price,
            name: name,
            image: image,
            onTap: () {
              isTapped = true;
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ),
    );
    var button = find.byType(CoinCard);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(isTapped, true);
    await tester.pumpAndSettle();
  });


}
