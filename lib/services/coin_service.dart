import 'package:crypto_test/model/coins.dart';
import 'package:http/http.dart' as http;
abstract class CoinSevice{
  final http.Client client;
  CoinSevice(this.client);
  Future<List<Coins>>? getCoinsFromAPI({required String currency,
    required int start,
    required int limit,
    required bool sparkline});
}