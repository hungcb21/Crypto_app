import 'dart:convert';

import 'package:crypto_test/config/app_config.dart';
import 'package:crypto_test/config/constants.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:crypto_test/services/coin_service.dart';
import 'package:http/http.dart' as http;

final String FINAL_API_URL = 'https://api.coingecko.com/api/v3/coins';
class AppCoinService{
  Future<List<Coins>> getCoinsFromAPI (
      {required String currency,
        required int start,
        required int limit,
        required bool sparkline}) async {
    var url = Uri.parse(FINAL_API_URL +
        '/markets?vs_currency=$currency&order=market_cap_desc&per_page=$limit&page=$start&sparkline=$sparkline');
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as List;
        List<Coins> listCoins = responseData.map((coins) {
          return Coins.fromJson(coins);
        }).toList();
        return listCoins;
      } else {
        return <Coins>[];
      }
    } catch (exception) {
      print('Exception sending api : ' + exception.toString());
      return <Coins>[];
    }
  }
}

