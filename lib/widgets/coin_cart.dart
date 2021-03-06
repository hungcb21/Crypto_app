import 'package:flutter/material.dart';

import '../constaints/text_style.dart';

class CoinCard extends StatelessWidget {
  VoidCallback onTap;
  String? image;
  String name;
  String symbol;
  var price;
  var price_change;

  CoinCard(
      {required this.image,
      required this.onTap,
      required this.name,
      required this.symbol,
      required this.price,
      required this.price_change});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Image.network(
            image ??
                "https://www.facebook.com/photo/?fbid=2940773096158854&set=a.1684300095139500",
            errorBuilder: (context, error, strackTrace) => Icon(Icons.error),
          ),
          title: Text(
            name,
            style: TextStylesApp.nameCoin,
          ),
          subtitle: Text('${price}  ${symbol.toUpperCase()}'),
          trailing: Text(
            price_change.toString(),
            style: TextStyle(
                color: price_change.toString().contains('-')
                    ? Colors.red
                    : Colors.green),
          ),
        ),
      ),
    );
  }
}
