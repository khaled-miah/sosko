import 'package:flutter/material.dart';

class PopularProductModel {
  String name;
  String type;
  String oldPrice;
  String price;
  Color color;
  Color textColor;
  String image;

  PopularProductModel(
      {this.name,
      this.type,
      this.oldPrice,
      this.price,
      this.color,
      this.textColor,
      this.image});
}
