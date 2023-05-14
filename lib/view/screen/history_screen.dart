import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/model/history_model.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/details_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class HistoryScreen extends KFDrawerContent  {
   HistoryScreen({Key key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryModel> historyProductList = [
    HistoryModel(
        name: 'PS5 Joystik',
        price: '\$20',
        sellingStatus: 'Pending',
        image: 'assets/images/joystick.png',
        statusColor: Color(0xffDC9E00)),
    HistoryModel(
        name: 'UBL Speaker',
        price: '\$20',
        sellingStatus: 'Delivered',
        iconImage: 'assets/images/order.png',
        image: 'assets/images/s.png',
        statusColor: Color(0xff00C34E)),
    HistoryModel(
        name: '3 Quater Pant',
        price: '\$30',
        sellingStatus: 'Cancel',
        iconImage: 'assets/images/order.png',
        image: 'assets/images/pant.png',
        statusColor: Color(0xffC33B00)),
    HistoryModel(
        name: 'Logistik Headphone',
        price: '\$30',
        sellingStatus: 'Cancel',
        iconImage: 'assets/images/order.png',
        image: 'assets/images/headphone.png',
        statusColor: Color(0xffC33B00)),
    HistoryModel(
        name: 'Mi Band 4',
        price: '\$30',
        sellingStatus: 'Delivered',
        iconImage: 'assets/images/order.png',
        image: 'assets/images/w.png',
        statusColor: Color(0xff00C34E)),
    HistoryModel(
        name: 'Hair Dryer',
        price: '\$30',
        sellingStatus: 'Delivered',
        iconImage: 'assets/images/order.png',
        image: 'assets/images/hd.png',
        statusColor: Color(0xff00C34E)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
          child: InkWell(
              onTap: () => context.nextPage(BottomNavigationScreen()),
              child: Image.asset('assets/images/Back.png')),
        ),
        title: Text(
          'History',
          style: KTextStyle.headline3.copyWith(fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: DimensionScreen.getWidth(context, 24),
            right: DimensionScreen.getWidth(context, 17)),
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.73,
                crossAxisSpacing: DimensionScreen.getWidth(context, 47),
                mainAxisSpacing: DimensionScreen.geHeight(context, 30)),
            itemCount: historyProductList.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.nextPage(DetailsScreen());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              historyProductList[index].image,
                              fit: BoxFit.cover,
                              height: DimensionScreen.geHeight(context, 140),
                              width: DimensionScreen.getWidth(context, 140),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(historyProductList[1].iconImage),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 8)),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(historyProductList[index].name,
                          style: KTextStyle.subtitle2),
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 4)),
                    Row(
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(historyProductList[0].price,
                              style:
                                  KTextStyle.headline3.copyWith(fontSize: 15)),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(historyProductList[0].sellingStatus,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: historyProductList[0].statusColor,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
