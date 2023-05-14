import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/main.dart';
import 'package:sosko/model/filter_model.dart';
import 'package:sosko/model/product_model.dart';
import 'package:sosko/model/popular_products_model.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/all_items_screen.dart';
import 'package:sosko/view/screen/cart_screen.dart';
import 'package:sosko/view/screen/details_screen.dart';
import 'package:sosko/view/screen/history_screen.dart';
import 'package:sosko/view/screen/onboard_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
   HomeScreen({Key key}) ;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickerImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickerImage != null) {
        _image = File(pickerImage.path);
      } else {
        print('no image selected');
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<int> _selectedItems = List<int>();
  final List<FilterModel> sliderList = [
    FilterModel(
      title: 'All',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Lifestyle',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Sports',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Clothing',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
  ];
  final List<PopularProductModel> ppList = [
    PopularProductModel(
        name: 'UBL Speaker',
        type: 'On Sale',
        oldPrice: '\$25',
        price: '\$20',
        color: Color(0xffFFD8D8),
        textColor: Color(0xffFF0000),
        image: 'assets/images/speaker.png'),
    PopularProductModel(
        name: 'Mi Band 4',
        type: 'Technology',
        price: '\$30',
        color: Color(0xffF3E7FF),
        textColor: Color(0xff8000FF),
        image: 'assets/images/watch.png'),
    PopularProductModel(
        name: 'Hair Dryer',
        type: 'Beauty',
        price: '\$30',
        color: Color(0xffFFECCE),
        textColor: Color(0xffFF9900),
        image: 'assets/images/hairdry.png')
  ];
  final List<ProductModel> productsList = [
    ProductModel(
      name: 'JoyStick',
      type: 'OnSell',
      price: '\$20',
      color: Color(0xffFFD8D8),
      textColor: Color(0xffFF0000),
      oldPrice: '25',
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
        image: "assets/images/pant.png")
  ];

  /*@override*//*
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle(color:Colors.white.withOpacity(0.8)),
          //colorTextUnSelected: Colors.white.withOpacity(0.5),
          colorLineSelected: Colors.teal,
        ),
        HomeScreen()));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 2",
          baseStyle: TextStyle(color:Colors.white.withOpacity(0.8)),
          colorLineSelected: Colors.orange,
        ),
        HistoryScreen()));
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldKey,
          /*drawer: Drawer(
            child: Container(
              color: KColor.tertiary,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/spactacle.png',
                            height: DimensionScreen.geHeight(context, 55),
                            width: DimensionScreen.getWidth(context, 55),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            left: 60,
                            child: Text('Yasin Rahib',
                                style: KTextStyle.body2
                                    .copyWith(
                                    color: KColor.white, fontSize: 18))),
                        Positioned(
                            top: 72,
                            left: 60,
                            child: Text(
                              'hellobesnik@gmail.com',
                              style:
                              KTextStyle.caption.copyWith(color: KColor.white),
                            )),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff00CC96),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: DimensionScreen.getWidth(context, 20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        Text('Discover',
                            style: KTextStyle.caption.copyWith(
                                fontSize: 22, color: KColor.veryLightGray)),
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        Text('Shop',
                            style: KTextStyle.caption.copyWith(
                                fontSize: 22, color: KColor.veryLightGray)),
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        InkWell(
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, '/historyScreen');
                            },
                            child: Text('History',
                                style: KTextStyle.caption.copyWith(
                                    fontSize: 22,
                                    color: KColor.veryLightGray))),
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        Text('Inbox',
                            style: KTextStyle.caption.copyWith(
                                fontSize: 22, color: KColor.veryLightGray)),
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        InkWell(
                          onTap: () =>
                              Navigator.popAndPushNamed(
                                  context, '/orderTrackingScreen'),
                          child: Text('Order Tracking',
                              style: KTextStyle.caption.copyWith(
                                  fontSize: 22, color: KColor.veryLightGray)),
                        ),
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(context, '/faqScreen');
                          },
                          child: Text('Ask an Expert',
                              style: KTextStyle.caption
                                  .copyWith(fontSize: 22, color: KColor.white)),
                        ),
                        SizedBox(height: DimensionScreen.geHeight(context, 45)),
                        InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, '/settingsScreen');
                          },
                          child: Text('Settings',
                              style: KTextStyle.caption.copyWith(
                                  fontSize: 22, color: KColor.veryLightGray)),
                        ),
                        SizedBox(height: DimensionScreen.geHeight(
                            context, 118)),
                        Image.asset(
                          'assets/images/ar.png',
                          height: DimensionScreen.geHeight(context, 43),
                          width: DimensionScreen.getWidth(context, 70.48),
                        ),
                        SizedBox(height: DimensionScreen.geHeight(context, 14)),
                        InkWell(
                          onTap: () =>
                              navigatorKey.currentState
                                  .pushNamedAndRemoveUntil('/onboardScreen',
                                      (Route<dynamic> route) => false),
                          child: Text('Log out',
                              style: KTextStyle.caption
                                  .copyWith(fontSize: 22, color: KColor.white)),
                        ),
                        SizedBox(height: DimensionScreen.geHeight(context, 87)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),*/
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(
                  left: DimensionScreen.getWidth(context, 24)),
              child: InkWell(
                onTap: (){
                  return widget.onMenuPressed;
                  },
                  //onTap: widget.onMenuPressed,
                      //_scaffoldKey.currentState.openDrawer(),
                  child: Image.asset('assets/images/Menu.png')),
            ),
            title: Text(
              'SOSKO',
              style: GoogleFonts.montserrat(
                  textStyle: KTextStyle.headline1.copyWith(fontSize: 20)),
            ),
            actions: [
              Padding(
                padding:
                EdgeInsets.only(right: DimensionScreen.getWidth(context, 24)),
                child: InkWell(
                    onTap: () =>
                        navigatorKey.currentState.pushNamed('/cartScreen'),
                    child: Image.asset('assets/images/notification.png')),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: DimensionScreen.getWidth(context, 24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: DimensionScreen.geHeight(context, 47)),

                  /// Banner
                  Container(
                      height: DimensionScreen.geHeight(context, 170),
                      decoration: BoxDecoration(
                          color: KColor.lightGrayishBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: DimensionScreen.getWidth(
                                    context, 22)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: DimensionScreen.geHeight(
                                        context, 19)),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '-skincare products',
                                    style: KTextStyle.caption.copyWith(
                                        fontSize: 10,
                                        color: KColor.vividViolet),
                                  ),
                                ),
                                SizedBox(
                                    height: DimensionScreen.geHeight(
                                        context, 4)),
                                Text('50% off on\nevery Skincare\nProducts',
                                    style: KTextStyle.headline3
                                        .copyWith(fontSize: 17)),
                                SizedBox(
                                    height: DimensionScreen.geHeight(
                                        context, 13)),
                                Container(
                                  height: DimensionScreen.geHeight(context, 30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: FlatButton(
                                      color: KColor.tertiary,
                                      height: DimensionScreen.geHeight(
                                          context, 30),
                                      minWidth:
                                      DimensionScreen.getWidth(context, 90),
                                      onPressed: () {
                                        context.nextPage(DetailsScreen());
                                      },
                                      child: Text('Shop Now',
                                          style: KTextStyle.headline1.copyWith(
                                              fontSize: 10,
                                              color: KColor.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: DimensionScreen.geHeight(context, 10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Image.asset(
                                    'assets/images/Image.png',
                                    height: DimensionScreen.geHeight(
                                        context, 133),
                                    width: DimensionScreen.getWidth(
                                        context, 139),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/Shadow.png',
                                  scale: 1.4,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(height: DimensionScreen.geHeight(context, 30)),

                  /// Category Slider
                  Container(
                    height: DimensionScreen.geHeight(context, 26),
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: sliderList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (_selectedItems.contains(index)) {
                              setState(() {
                                _selectedItems.removeWhere((val) =>
                                val == index);
                              });
                            } else {
                              setState(() {
                                _selectedItems.add(index);
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: DimensionScreen.getWidth(
                                    context, 5)),
                            height: DimensionScreen.geHeight(context, 26),
                            decoration: BoxDecoration(
                                color: (_selectedItems.contains(index))
                                    ? KColor.tertiary
                                    : sliderList[index].backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  DimensionScreen.getWidth(context, 16)),
                              child: Center(
                                child: Text(sliderList[index].title,
                                    style: KTextStyle.body2.copyWith(
                                        color: (_selectedItems.contains(index))
                                            ? KColor.white
                                            : sliderList[index].textColor)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: DimensionScreen.geHeight(context, 29)),

                  /// Special For You
                  Row(
                    children: [
                      Text('Special For You',
                          style: KTextStyle.headline3.copyWith(fontSize: 18)),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () => context.nextPage(AllItemsScreen()),
                            child: Text('See all',
                                style: KTextStyle.headline1.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DimensionScreen.geHeight(context, 15)),
                  Container(
                    height: DimensionScreen.geHeight(context, 194),
                    child: ListView.builder(
                        itemCount: productsList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: EdgeInsets.only(
                                  right: DimensionScreen.getWidth(context, 24)),
                              child: InkWell(
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
                                    Container(
                                        height:
                                        DimensionScreen.geHeight(context, 140),
                                        width:
                                        DimensionScreen.getWidth(context, 140),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                5)),
                                        child:
                                        Image.asset(productsList[index].image)),
                                    SizedBox(
                                        height:
                                        DimensionScreen.geHeight(context, 7)),
                                    Text(productsList[index].name,
                                        style: KTextStyle.subtitle2),
                                    SizedBox(
                                        height:
                                        DimensionScreen.geHeight(context, 4)),
                                    Row(
                                      children: [
                                        Container(
                                          height:
                                          DimensionScreen.geHeight(context, 18),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                16),
                                            child: FlatButton(
                                              color: productsList[index].color,
                                              height: DimensionScreen.geHeight(
                                                  context, 18),
                                              minWidth: DimensionScreen
                                                  .getWidth(
                                                  context, 40),
                                              onPressed: () {},
                                              child: Text(
                                                  productsList[index].type,
                                                  style: TextStyle(
                                                      color: productsList[index]
                                                          .textColor,
                                                      fontSize: 7)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: DimensionScreen.getWidth(
                                                context, 20)),
                                        Text(
                                          productsList[index].oldPrice ?? "",
                                          style: TextStyle(
                                              decoration:
                                              TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                            width: DimensionScreen.getWidth(
                                                context, 5)),
                                        Text(productsList[index].price,
                                            style: KTextStyle.headline3
                                                .copyWith(fontSize: 15)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                  SizedBox(height: DimensionScreen.geHeight(context, 37)),

                  /// Popular Products
                  Row(
                    children: [
                      Text(
                        'Popular Products',
                        style: KTextStyle.headline3.copyWith(fontSize: 18),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () => context.nextPage(AllItemsScreen()),
                            child: Text('See all',
                                style: KTextStyle.headline1.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DimensionScreen.geHeight(context, 15)),
                  Container(
                    height: DimensionScreen.geHeight(context, 194),
                    child: ListView.builder(
                        itemCount: ppList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: EdgeInsets.only(
                                  right: DimensionScreen.getWidth(context, 24)),
                              child: InkWell(
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
                                    Container(
                                        height:
                                        DimensionScreen.geHeight(context, 140),
                                        width:
                                        DimensionScreen.getWidth(context, 140),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                5)),
                                        child: Image.asset(
                                            ppList[index].image)),
                                    SizedBox(
                                        height:
                                        DimensionScreen.geHeight(context, 7)),
                                    Text(ppList[index].name,
                                        style: KTextStyle.subtitle2),
                                    SizedBox(
                                        height:
                                        DimensionScreen.geHeight(context, 4)),
                                    Row(
                                      children: [
                                        Container(
                                          height:
                                          DimensionScreen.geHeight(context, 18),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                16),
                                            child: FlatButton(
                                              color: ppList[index].color,
                                              height: DimensionScreen.geHeight(
                                                  context, 18),
                                              minWidth: DimensionScreen
                                                  .getWidth(
                                                  context, 40),
                                              onPressed: () {},
                                              child: Text(ppList[index].type,
                                                  style: TextStyle(
                                                      color:
                                                      ppList[index].textColor,
                                                      fontSize: 7)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                          DimensionScreen.getWidth(context, 20),
                                        ),
                                        Text(
                                          ppList[index].oldPrice ?? "",
                                          style: TextStyle(
                                              decoration:
                                              TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width:
                                          DimensionScreen.getWidth(context, 5),
                                        ),
                                        Text(ppList[index].price,
                                            style: TextStyle(
                                                color: Color(0xff172239),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),

                  /// Bottom Padding (To avoid overlapping with Scan Icon)
                  SizedBox(height: kBottomNavigationBarHeight)
                ],
              ),
            ),
          ),
        );

  }
}
