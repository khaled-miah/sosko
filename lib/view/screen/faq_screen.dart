import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sosko/view/global_widgets/custom_expansion_tile.dart' as custom;

class FAQScreen extends KFDrawerContent {
   FAQScreen({Key key}) ;

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isExpanded = false;

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
            padding: EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
            child: InkWell(
                onTap: () => context.nextPage(BottomNavigationScreen()),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Text(
            'FAQ',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 47)),
              Text('Frequently Asked Questions', style: KTextStyle.headline3),
              SizedBox(height: DimensionScreen.geHeight(context, 39)),
              Text('General', style: KTextStyle.body2.copyWith(fontSize: 18)),
              SizedBox(height: DimensionScreen.geHeight(context, 9)),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.all(0),
                  child: ExpansionTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '1. How do I place an\norder on your website?',
                        style: KTextStyle.headline3.copyWith(fontSize: 20),
                      ),
                    ),
                    trailing: Container(
                        height: DimensionScreen.geHeight(context, 36),
                        width: DimensionScreen.getWidth(context, 36),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: KColor.tertiary)),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                          color: isExpanded ? KColor.tertiary : KColor.tertiary,
                        )),
                    children: [
                      SizedBox(height: DimensionScreen.geHeight(context, 10)),
                      Text(
                        'All you Need to do to place an order on our\nwebsite is to choose the product that you\nwould like to buy,then add it to cart and pay\nfor it using any of the supported payment \nmethod',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ],
                    /*  onExpansionChanged: (bool expanding) =>
                        setState(() => this.isExpanded = expanding),*/
                  ),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 35)),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.all(0),
                  child: ExpansionTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '2.What is your return?',
                        style: KTextStyle.headline3.copyWith(fontSize: 20),
                      ),
                    ),
                    trailing: Container(
                        height: DimensionScreen.geHeight(context, 36),
                        width: DimensionScreen.getWidth(context, 36),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: KColor.tertiary)),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                          color: isExpanded ? KColor.tertiary : KColor.tertiary,
                        )),
                    children: [
                      SizedBox(height: DimensionScreen.geHeight(context, 10)),
                      Text(
                        'All you Need to do to place an order on our',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 40)),
              IconTheme.merge(
                data: IconThemeData(color: KColor.tertiary),
                child: Theme(
                  data: ThemeData().copyWith(
                    dividerColor: Colors.transparent,
                    accentColor: Colors.red,
                  ),
                  child: ListTileTheme(
                    contentPadding: EdgeInsets.all(0),
                    child: ExpansionTile(
                      title: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '3.What shipping company?',
                          style: KTextStyle.headline3.copyWith(fontSize: 20),
                        ),
                      ),
                      trailing: Container(
                          height: DimensionScreen.geHeight(context, 36),
                          width: DimensionScreen.getWidth(context, 36),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: KColor.tertiary)),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: isExpanded ? KColor.tertiary : KColor.tertiary,
                          )),
                      children: [
                        SizedBox(height: DimensionScreen.geHeight(context, 10)),
                        Text(
                          'All you Need to do to place an order on our',
                          style: KTextStyle.body2.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
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
