import 'dart:ffi';

class SparkLine{
  Array price;

  SparkLine({required this.price});

  factory SparkLine.fromJson(Map<String, dynamic> json) {
    return SparkLine(
      price: json['price'],
    );
  }
}