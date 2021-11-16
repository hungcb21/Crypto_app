import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/constaints/routes.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:crypto_test/routes/app_route.dart';
import 'package:crypto_test/screens/detail_screen/detail_screen.dart';

import 'package:crypto_test/screens/home_screen/home_screen.dart';
import 'package:crypto_test/widgets/coin_cart.dart';
import 'package:crypto_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

main() {
  final mockObserver = MockNavigatorObserver();
  late ListCoinsBloc coinsBloc;
  // testWidgets('Should search Coin when bloc state is [ListCoinsLoaded]',
  //         (tester) async {
  //       await tester.pumpWidget(MaterialApp(
  //         onGenerateRoute: AppRoute.generateRoute,
  //         initialRoute: RouteConstant.welcomeRoute,
  //         home: DetailScreen(),
  //         navigatorObservers: [mockObserver],
  //         // onGenerateRoute: AppRoute.generateRoute,
  //       ));
  //       await tester.pumpAndSettle();
  //       await tester.tap(find.byType(SearchBar));
  //       await tester.enterText(find.byType(SearchBar), 'bitcoin');
  //       await tester.pump(const Duration(seconds: 1));
  //       final coinCardFinder = find.descendant(
  //           of: find.byType(ListView), matching: find.byType(GestureDetector).first);
  //       expect(coinCardFinder, findsOneWidget);
  //       await tester.tap(coinCardFinder);
  //       await tester.pumpAndSettle();
  //       verify(() => mockObserver.didPush(any(), any())).called(7);
  //     });


}
