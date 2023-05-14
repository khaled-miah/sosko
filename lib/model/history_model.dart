import 'package:flutter/cupertino.dart';

class HistoryModel {
  String name;
  String price;
  String sellingStatus;
  String iconImage;
  String image;
  Color statusColor;

  HistoryModel(
      {this.name,
        this.price,
        this.sellingStatus,
        this.iconImage,
        this.image,
        this.statusColor,
      });
}
