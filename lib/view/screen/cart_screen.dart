import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/checkout_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreeen extends StatefulWidget {
  const CartScreeen({Key key}) : super(key: key);

  @override
  _CartScreeenState createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  FocusNode focusNode;
  void dismissKeyboard() {
    focusNode.unfocus();
  }
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
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/cartScreen', ModalRoute.withName('/bottomNavScreen')),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Column(
            children: [
              Text(
                'Your Cart',
                style: KTextStyle.headline3.copyWith(fontSize: 20),
              ),
              Text(
                '2 Items',
                style: KTextStyle.body2.copyWith(fontSize: 12),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: DimensionScreen.getWidth(context, 24)),
            child: Column(
              children: [
                SizedBox(height: DimensionScreen.geHeight(context, 39)),
                Container(
                  height: DimensionScreen.geHeight(context, 100),
                  decoration: BoxDecoration(color: KColor.lightGrayishBlue),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: DimensionScreen.getWidth(context, 30)),
                          child: Text(
                            '25',
                            style: KTextStyle.headline3.copyWith(fontSize: 40),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                '%',
                                style:
                                    KTextStyle.headline3.copyWith(fontSize: 24),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Off',
                                style:
                                    KTextStyle.headline3.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 30)),
                        Container(
                            height: DimensionScreen.geHeight(context, 82),
                            child: VerticalDivider(
                              width: 3,
                              color: KColor.grayishBlue,
                              thickness: 2,
                            )),
                        SizedBox(width: DimensionScreen.getWidth(context, 36)),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'use code',
                              style: KTextStyle.body2.copyWith(fontSize: 16)),
                          TextSpan(
                              text: ' UIHUT',
                              style: KTextStyle.headline3.copyWith(fontSize: 16)),
                          TextSpan(
                              text: '\nat checkout',
                              style: KTextStyle.body2.copyWith(fontSize: 16)),
                        ]))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 30)),
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    height: DimensionScreen.geHeight(context, 74),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/joystick.png',
                          height: DimensionScreen.geHeight(context, 74),
                          width: DimensionScreen.getWidth(context, 74),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: DimensionScreen.getWidth(context, 20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('PS5 Wireless\nJoystik',
                                    style: KTextStyle.subtitle2),
                              ),
                              SizedBox(
                                  height: DimensionScreen.geHeight(context, 8)),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('\$20.00',
                                    style: KTextStyle.headline1.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: DimensionScreen.geHeight(context, 5)),
                              child: Text('1x',
                                  style: KTextStyle.body2
                                      .copyWith(color: KColor.grayishBlue2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  secondaryActions: <Widget>[
                    Image.asset(
                      'assets/images/Delete.png',
                      width: DimensionScreen.getWidth(context, 50),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 30)),
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    height: DimensionScreen.geHeight(context, 74),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/headphone.png',
                          height: DimensionScreen.geHeight(context, 74),
                          width: DimensionScreen.getWidth(context, 74),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: DimensionScreen.getWidth(context, 20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: DimensionScreen.geHeight(context, 5)),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('Logistik Headphone',
                                    style: KTextStyle.subtitle2),
                              ),
                              SizedBox(
                                  height: DimensionScreen.geHeight(context, 9)),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('\$60.00',
                                    style: KTextStyle.headline1.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: DimensionScreen.geHeight(context, 5)),
                              child: Text('2x',
                                  style: KTextStyle.body2
                                      .copyWith(color: KColor.grayishBlue2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  secondaryActions: <Widget>[
                    Image.asset(
                      'assets/images/Delete.png',
                      width: DimensionScreen.getWidth(context, 50),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 30)),
                Divider(),
                SizedBox(height: DimensionScreen.geHeight(context, 22)),
                Container(
                  height: DimensionScreen.geHeight(context, 54),
                  decoration: BoxDecoration(
                      color: KColor.lightGrayishBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: TextField(
                          focusNode: FocusNode(),
                          //textInputAction: TextInputAction.go,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Promo Code',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: DimensionScreen.geHeight(context, 10),
                                vertical: DimensionScreen.getWidth(context, 10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: FlatButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                },
                                child: Text(
                                  'Add',
                                  style: KTextStyle.body2
                                      .copyWith(color: KColor.white),
                                ),
                                color: KColor.tertiary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 60)),
                Row(
                  children: [
                    Text('Discount:',
                        style: KTextStyle.body2.copyWith(fontSize: 16)),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text('\$0.00',
                              style:
                                  KTextStyle.headline3.copyWith(fontSize: 26))),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 23)),
                Row(
                  children: [
                    Text('Total:',
                        style: KTextStyle.body2.copyWith(fontSize: 16)),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text('\$80.00',
                              style:
                                  KTextStyle.headline3.copyWith(fontSize: 26))),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 57)),
                Container(
                    height: DimensionScreen.geHeight(context, 64),
                    width: DimensionScreen.getWidth(context, 263),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                          color: KColor.tertiary,
                          onPressed: () {
                            context.nextReplacementPage(CheckOutScreen());
                          },
                          child: Text('Checkout',
                              style: KTextStyle.headline1
                                  .copyWith(color: KColor.white, fontSize: 18))),
                    )),
                SizedBox(height: DimensionScreen.geHeight(context, 40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
