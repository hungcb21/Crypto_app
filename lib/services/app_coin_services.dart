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
    // final url = Uri(
    //   scheme: 'https',
    //   host: AppConfig.instance.getValue(AppConstants.HOST_NAME),
    //   path: AppConfig.instance.getValue(AppConstants.COIN_PATH+AppConstants.MARKET_PATH +
    //       AppConstants.CURRENCY +
    //       '$currency' +
    //       AppConstants.ORDER+AppConstants.LIMIT+'$limit'+AppConstants.START+'$start'+AppConstants.SPARKLINE+'$sparkline'),
    // );
    var url = Uri.parse(FINAL_API_URL +
        AppConstants.COIN_PATH +
        AppConstants.MARKET_PATH +
        AppConstants.CURRENCY +
        '$currency' +
        AppConstants.ORDER +
        AppConstants.LIMIT +
        '$limit' +
        AppConstants.START +
        '$start' +
        AppConstants.SPARKLINE +
        '$sparkline');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
      List<Coins> listCoins = responseData.map((coins) {
        return Coins.fromJson(coins);
      }).toList();
      return listCoins;
    } else {
      throw Exception('Failed to load coins list');
    }
  }
}
