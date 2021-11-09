import 'package:crypto_test/blocs/list_coins_bloc/list_coins_bloc.dart';
import 'package:crypto_test/screens/home_screen/home_screen.dart';
import 'package:crypto_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final listName = 'Coins';
  final widgetHomeScreen = MaterialApp(
    home:
        BlocProvider(create: (context) => ListCoinsBloc(), child: HomeScreen()),
  );
  testWidgets('Should render SearchBar ', (tester) async {
    await tester.pumpWidget(widgetHomeScreen);
    expect(find.byType(SearchBar), findsOneWidget);
  });

  testWidgets('Should render name of list ', (tester) async {
    await tester.pumpWidget(widgetHomeScreen);
    expect(find.text(listName), findsOneWidget);
  });
}
