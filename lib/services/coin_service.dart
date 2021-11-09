import '../model/coins.dart';
import 'package:http/http.dart' as http;

abstract class CoinService {
  final http.Client client;

  CoinService(this.client);
  Future<List<Coins>>? getCoinsFromAPI(
      {required String currency,
      required int start,
      required int limit,
      required bool sparkline});
}
