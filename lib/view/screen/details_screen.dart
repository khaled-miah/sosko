import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/cart_screen.dart';
import 'package:sosko/view/screen/home_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffF6F7FB),
          elevation: 0,
          leading: Padding(
            padding:  EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
            child: InkWell(
                onTap: () => context.nextPage(BottomNavigationScreen()),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Text(
            'Details',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
          ),
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(right: DimensionScreen.getWidth(context, 24)),
              child: Image.asset('assets/images/Heart.png'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: DimensionScreen.geHeight(context, 300),
                width: double.infinity,
                color: KColor.lightGrayishBlue,
                child: Image.asset(
                  'assets/images/jsh.png',
                  height: DimensionScreen.geHeight(context, 215),
                  width: DimensionScreen.getWidth(context, 230),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: DimensionScreen.getWidth(context, 24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: DimensionScreen.geHeight(context, 20),
                        width: DimensionScreen.getWidth(context, 68),
                        decoration: BoxDecoration(
                            color: KColor.paleViolet,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text('Technology',
                              style: KTextStyle.body2
                                  .copyWith(fontSize: 10, color: KColor.violet)),
                        )),
                    SizedBox(height: DimensionScreen.geHeight(context, 10)),
                    Text('PS5 JoyStik',
                        style: KTextStyle.headline3.copyWith(fontSize: 26)),
                    SizedBox(height: DimensionScreen.geHeight(context, 12)),
                    Row(
                      children: [
                        Text('5.0', style: KTextStyle.body2),
                        Icon(Icons.star, color: KColor.vividYellow, size: 20),
                        Icon(Icons.star, color: KColor.vividYellow, size: 20),
                        Icon(Icons.star, color: KColor.vividYellow, size: 20),
                        Icon(Icons.star, color: KColor.vividYellow, size: 20),
                        Icon(Icons.star, color: KColor.vividYellow, size: 20),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('\$25',
                                style: KTextStyle.body2.copyWith(
                                    color: KColor.grayishBlue2, fontSize: 20)),
                          ),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 10)),
                        Text('\$20',
                            style: KTextStyle.headline3.copyWith(fontSize: 30)),
                      ],
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 29)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/cb.png',
                          height: DimensionScreen.geHeight(context, 24),
                          width: DimensionScreen.getWidth(context, 24),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 16)),
                        Image.asset(
                          'assets/images/cg.png',
                          height: DimensionScreen.geHeight(context, 24),
                          width: DimensionScreen.getWidth(context, 24),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 16)),
                        Image.asset(
                          'assets/images/ca.png',
                          height: DimensionScreen.geHeight(context, 24),
                          width: DimensionScreen.getWidth(context, 24),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 16)),
                        Stack(
                          children: [
                            Image.asset('assets/images/cc.png',
                                height: DimensionScreen.geHeight(context, 40),
                                width: DimensionScreen.getWidth(context, 40)),
                            Positioned(
                                top: 8,
                                right: 8,
                                left: 8,
                                bottom: 8,
                                child: Image.asset('assets/images/ccc.png',
                                    height: DimensionScreen.geHeight(context, 24),
                                    width: DimensionScreen.getWidth(context, 24)))
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset('assets/images/bm.png',
                                height: DimensionScreen.geHeight(context, 40),
                                width: DimensionScreen.getWidth(context, 40)),
                          ),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 16)),
                        Text(
                          '1',
                          style: KTextStyle.headline3.copyWith(fontSize: 20),
                        ),
                        SizedBox(width: DimensionScreen.getWidth(context, 15)),
                        Image.asset('assets/images/bp.png',
                            height: DimensionScreen.geHeight(context, 40),
                            width: DimensionScreen.getWidth(context, 40)),
                      ],
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 20)),
                    EasyRichText(
                      "Wireless Controller for PS5TM gives you what you want in your gaming from over precision control your games to sharing.",
                      defaultStyle: KTextStyle.body2
                          .copyWith(fontWeight: FontWeight.normal),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'TM',
                          superScript: true,
                          stringBeforeTarget: 'PS5',
                          matchWordBoundaries: false,
                          style: KTextStyle.body2
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 14)),
                    Row(
                      children: [
                        Text('See More Detail',
                            style: KTextStyle.headline1.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(width: DimensionScreen.getWidth(context, 10)),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: KColor.tertiary,
                          size: 15,
                        )
                      ],
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 62)),
                    Center(
                      child: Container(
                          height: DimensionScreen.geHeight(context, 64),
                          width: DimensionScreen.getWidth(context, 263),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FlatButton(
                                color: KColor.tertiary,
                                onPressed: () {
                                  context.nextReplacementPage(CartScreeen());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/bgg.png',
                                        height:
                                            DimensionScreen.geHeight(context, 19),
                                        width: DimensionScreen.getWidth(
                                            context, 16)),
                                    SizedBox(
                                        width: DimensionScreen.getWidth(
                                            context, 10)),
                                    Text(
                                      'Add to Cart',
                                      style: KTextStyle.headline1.copyWith(
                                          color: KColor.white, fontSize: 18),
                                    ),
                                  ],
                                )),
                          )),
                    ),
                    SizedBox(height: DimensionScreen.geHeight(context, 40)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
