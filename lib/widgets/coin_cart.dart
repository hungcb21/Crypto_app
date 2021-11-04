import 'package:flutter/material.dart';

class CoinCart extends StatelessWidget {
  var image;
  String name;
  String symbol;
  var price;
  var price_change;

  CoinCart(
      {required this.image,
      required this.name,
      required this.symbol,
      required this.price,
      required this.price_change});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(image??'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true')
        ,
        title: Text(name),
        subtitle: Text('${price} ${symbol.toUpperCase()}'),
        trailing: Text(price_change.toString(),style: TextStyle(color: price_change.toString().contains('-')?Colors.red:Colors.green),),
      ),
    );
  }
}
