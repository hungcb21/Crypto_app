import 'package:flutter/cupertino.dart';

class Coins {
  String id;
  String name;
  String symbol;
  var image;
  var current_price;
  var high_24h;
  var low_24h;
  var price_change_24h;
  var ath;
  var ath_change_percentage;
  var ath_date;
  var atl;
  var atl_change_percentage;
  var atl_date;
  var last_updated;

  Coins(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.image,
      required this.current_price,
      required this.high_24h,
      required this.low_24h,
      required this.price_change_24h,
      required this.ath,
      required this.ath_change_percentage,
      required this.ath_date,
      required this.atl,
      required this.atl_change_percentage,
      required this.atl_date,
      required this.last_updated});

  factory Coins.fromJson(Map<String, dynamic> json) {
    return Coins(
        id: json["id"],
        name: json["name"],
        symbol: json['symbol'],
        image: json['image'],
        ath: json['aut'],
        ath_change_percentage: json['ath_change_percentage'],
        ath_date: json['ath_date'],
        atl: json['atl'],
        atl_change_percentage: json['atl_change_percentage'],
        atl_date: json['atl_date'],
        current_price: json['current_price'],
        high_24h: json['high_24h'],
        last_updated: json['last_updated'],
        low_24h: json['low_24h'],
        price_change_24h: json['price_change_24h']);
  }
}
