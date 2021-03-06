import 'dart:convert';
import 'dart:math';

import '../config/app_config.dart';
import '../config/constants.dart';
import '../model/coins.dart';
import 'coin_service.dart';
import 'package:http/http.dart' as http;

final String FINAL_API_URL = 'https://api.coingecko.com/api/v3';

class AppCoinService extends CoinService {
  AppCoinService(http.Client client) : super(client);

  Future<List<Coins>> getCoinsFromAPI(
      {required String currency,
      required int start,
      required int limit,
      required bool sparkline}) async {
    var url = Uri.parse(AppConfig.instance.getValue(AppConstants.HOST_NAME) +
        AppConfig.instance.getValue(AppConstants.COIN_PATH) +
        AppConfig.instance.getValue(AppConstants.MARKET_PATH) +
        AppConfig.instance.getValue(AppConstants.CURRENCY) +
        '$currency' +
        AppConfig.instance.getValue(AppConstants.ORDER) +
        AppConfig.instance.getValue(AppConstants.LIMIT) +
        '$limit' +
        AppConfig.instance.getValue(AppConstants.START) +
        '$start' +
        AppConfig.instance.getValue(AppConstants.SPARKLINE) +
        '$sparkline');
    try {
      final response = await client.get(url);
      Iterable  responseData = json.decode(response.body) as List;
      List<Coins> listCoins = responseData.map((coins) {
        return Coins.fromJson(coins);
      }).toList();
      return listCoins;
    } catch (e) {
      throw Exception(e);
    }
  }
}
