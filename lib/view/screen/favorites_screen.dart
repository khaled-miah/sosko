import 'package:flutter/material.dart';
import 'package:sosko/model/product_model.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/details_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<ProductModel> productList = [
    ProductModel(
      name: 'JoyStick',
      type: 'OnSell',
      price: '\$20',
      color: Color(0xffFFD8D8),
      textColor: Color(0xffFF0000),
      oldPrice: '\$25',
      image: "assets/images/joystick.png",
    ),
    ProductModel(
      name: 'Logistik Headphone',
      type: 'technology',
      price: '\$30',
      color: Color(0xffF3E7FF),
      textColor: Color(0xff8000FF),
      image: "assets/images/headphone.png",
    ),
    ProductModel(
        name: '3 Quater Pant',
        type: 'Clothings',
        price: '\$30',
        color: Color(0xffE5FFF7),
        textColor: Color(0xff00FFB2),
        image: "assets/images/pant.png"),
    ProductModel(
      name: 'UBL Speaker',
      type: 'OnSell',
      price: '\$20',
      color: Color(0xffFFD8D8),
      textColor: Color(0xffFF0000),
      oldPrice: '\$25',
      image: "assets/images/s.png",
    ),
    ProductModel(
      name: 'Mi Band 4',
      type: 'technology',
      price: '\$30',
      color: Color(0xffF3E7FF),
      textColor: Color(0xff8000FF),
      image: "assets/images/w.png",
    ),
    ProductModel(
      name: 'Hair Dryer',
      type: 'technology',
      price: '\$30',
      color: Color(0xffFFECCE),
      textColor: Color(0xffFF9900),
      image: "assets/images/headphone.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: InkWell(
                onTap: () => context.nextPage(BottomNavigationScreen()),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Text(
            'Favorites',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  crossAxisSpacing: DimensionScreen.getWidth(context, 47),
                  mainAxisSpacing: DimensionScreen.geHeight(context, 40)),
              itemCount: productList.length,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          productList[index].image,
                          fit: BoxFit.cover,
                          height: DimensionScreen.geHeight(context, 140),
                          width: DimensionScreen.getWidth(context, 140),
                        ),
                      ),
                      SizedBox(height: DimensionScreen.geHeight(context, 8)),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(productList[index].name,
                            style: KTextStyle.subtitle2),
                      ),
                      SizedBox(height: DimensionScreen.geHeight(context, 4)),
                      Row(
                        children: [
                          Container(
                            height: DimensionScreen.geHeight(context, 18),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: FlatButton(
                                color: productList[index].color,
                                height: DimensionScreen.geHeight(context, 18),
                                minWidth: DimensionScreen.getWidth(context, 40),
                                onPressed: () {},
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(productList[index].type,
                                      style: TextStyle(
                                          color: productList[index].textColor,
                                          fontSize: 7)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: DimensionScreen.getWidth(context, 20),
                          ),
                          Text(
                            productList[index].oldPrice ?? "",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: DimensionScreen.getWidth(context, 5),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(productList[index].price,
                                style: KTextStyle.headline3
                                    .copyWith(fontSize: 15)),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
