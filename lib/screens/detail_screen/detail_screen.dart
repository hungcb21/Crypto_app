import 'package:crypto_test/constaints/colors.dart';
import 'package:crypto_test/constaints/strings.dart';
import 'package:crypto_test/model/coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DetailScreen extends StatefulWidget {
  Coins coins;

  DetailScreen(this.coins);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Coins get _coins => widget.coins;
  double heightOfTopContainer = 300;
  double heightOfBottomContainer = 300;
  double sizeOfCoinImage = 70;
  double borderWidthOfChart = 2;
  final coinInfoPadding = EdgeInsets.symmetric(horizontal: 30);
  final chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 10);
  final chartCoinBorderRadius = BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  );

  @override
  Widget build(BuildContext context) {
    TextStyle infoCoinTextStyle = Theme
        .of(context)
        .textTheme
        .headline6!
        .copyWith(color: Colors.grey, fontSize: 20);
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text('${_coins.name} ${_coins.symbol.toUpperCase()}'),
        backwardsCompatibility: false,
        systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: heightOfTopContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: sizeOfCoinImage,
                    padding: coinInfoPadding,
                    child: Image.network(
                      widget.coins.image!,
                      errorBuilder: (context, error, strackTrace) =>
                          Icon(Icons.error),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Price: ${double.parse(_coins.current_price.toString())
                            .toStringAsFixed(3)}',
                        style: infoCoinTextStyle,
                      ),
                      Text(
                        'Price change 24h: ${double.parse(_coins.price_change_24h.toString())
                            .toStringAsFixed(3)}',
                        style: infoCoinTextStyle,
                      ),

                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: chartCoinPadding,
              height: heightOfBottomContainer,
              decoration: BoxDecoration(
                  color: ColorsApp.backgroundBottomColor,
                  borderRadius: chartCoinBorderRadius),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${_coins.symbol.toUpperCase()}/${StringData.USD}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.grey, fontSize: 15)),
                      Text(
                        '${_coins.sparkline_in_7d!.last.toStringAsFixed(3)}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 15),
                      )
                    ],
                  ),
                  Flexible(
                    child: SfSparkAreaChart(
                      borderWidth: borderWidthOfChart,
                      color: ColorsApp.chartColor,
                      borderColor: Colors.orange,
                      trackball: SparkChartTrackball(
                          borderColor: Colors.white,
                          backgroundColor: Colors.white,
                          labelStyle:
                          Theme
                              .of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                            color: Colors.orange,
                          )),
                      data: _coins.sparkline_in_7d!.cast<double>(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
